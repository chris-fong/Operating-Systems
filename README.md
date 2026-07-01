# Operating Systems — 8051 Multithreading Kernel

**Course:** CS 342302 Operating Systems (NTHU) · Prof. Pai H. Chou
**Author:** Christopher Samuel Fong 方文豪 · Student ID 112006233

A small **multithreading kernel written from scratch for the Intel 8051** microcontroller,
built up over five programming-project checkpoints. It is compiled with **SDCC** and runs on
the **EdSim51** 8051 simulator. The project starts from a cooperative scheduler and evolves
into a timer-driven **preemptive** kernel with **counting semaphores**, a **bounded buffer**,
and a **starvation-free** multi-producer/consumer solution — then drives real peripherals
(button bank, keypad, LCD) and ends with a fully threaded **dinosaur game**.

Everything runs in the 8051's tiny 128 bytes of internal RAM, so all kernel state and shared
data are hand-placed at fixed addresses to coexist with SDCC's register banks and scratch area.

---

## Repository Layout

Each folder is a self-contained, buildable checkpoint:

| Folder | Checkpoint | Focus |
|--------|-----------|-------|
| [`112006233_ppc1/`](112006233_ppc1) | **CP1** | Cooperative multithreading (`ThreadCreate` / `ThreadYield` / `ThreadExit`) + producer–consumer |
| [`112006233_ppc2/`](112006233_ppc2) | **CP2** | Preemptive multithreading via a Timer 0 interrupt + `__critical` sections |
| [`112006233_ppc3/`](112006233_ppc3) | **CP3** | Counting semaphores + 3-slot bounded buffer |
| [`ppc4/`](ppc4) | **CP4** | Two producers / one consumer, starvation analysis + a fair scheduler |
| [`ppc5/`](ppc5) | **CP5** | Real peripherals (button bank, keypad, LCD) + a threaded dinosaur game |

Each folder contains the kernel (`cooperative.*` or `preemptive.*`), a test application, a
`Makefile`, and the SDCC build artifacts (`.hex`, `.map`, `.rst`, `.lst`, …). The `.hex` file
is what you load into EdSim51; the `.rst` file (source + assembly interleaved) is handy for
source-level debugging in the simulator.

---

## Core Design

### Threads, stacks, and register banks
- `MAXTHREADS = 4`. A **bitmap** (`thread_mask`) tracks which thread IDs are live.
- Each thread owns a **16-byte stack** starting at `0x3F + (ThreadID × 16)` and its **own 8051
  register bank** — Thread 0 → bank 0, Thread 1 → bank 1, and so on.
- Because each thread has a dedicated register bank, a context switch only needs to save/restore
  `ACC`, `B`, `DPH`, `DPL`, and `PSW`; the general registers `R0–R7` come along "for free" when
  `PSW`'s `RS1:RS0` bank-select bits change.
- `ThreadCreate()` temporarily moves `SP` into the new thread's stack region and hand-builds an
  initial stack frame (return address = thread entry point, cleared `ACC`/`B`/`DPH`/`DPL`, and a
  `PSW` preloaded with the thread's register bank) so the scheduler can "restore" a thread that
  has never actually run yet.

### Verifying a context switch in the simulator
Because each thread has its own bank and stack, the running thread is identifiable at any
breakpoint from three values: the **PC** (matched against the `.map` file), the **PSW** bank
bits, and the **SP** range. Thread 0 shows `PSW = 00H` with `SP` in `0x3F–0x4F`; Thread 1 shows
`PSW = 08H` (RS0 = 1) with `SP` in `0x50–0x5F`; Thread 2 shows `PSW = 10H` (RS1 = 1) with `SP`
in `0x60–0x6F`.

---

## Checkpoint 1 — Cooperative Multithreading
`112006233_ppc1/` — [`cooperative.c`](112006233_ppc1/cooperative.c) · [`testcoop.c`](112006233_ppc1/testcoop.c)

The first kernel is **cooperative**: threads keep running until they voluntarily call
`ThreadYield()`. It implements:

- `Bootstrap()` — creates a thread for `main()` and restores its context to start it.
- `ThreadCreate(fp)` — allocates a thread ID/stack/bank as described above.
- `ThreadYield()` — `SAVESTATE`, pick the next live thread round-robin, `RESTORESTATE`.
- `ThreadExit()` — clear the thread's bit and switch away permanently.

The test app is a **producer–consumer**: the Producer runs as Thread 0 (`main`) generating
`'A'..'Z'`, and the Consumer is spawned as Thread 1, sending each character to the UART. They
share a one-byte buffer with a `data_ready` flag and cooperatively `ThreadYield()` while
waiting (buffer full / buffer empty / UART busy).

---

## Checkpoint 2 — Preemptive Multithreading
`112006233_ppc2/` — [`preemptive.c`](112006233_ppc2/preemptive.c) · [`testpreempt.c`](112006233_ppc2/testpreempt.c)

All explicit `ThreadYield()` calls are removed; scheduling is now driven by **hardware**:

- `Bootstrap()` configures **Timer 0** (`TMOD = 0`, `IE = 0x82`, `TR0 = 1`). Every timer overflow
  fires `myTimer0Handler()`, which context-switches to the next runnable thread and returns with
  `RETI`.
- Because the C thread-selection loop clobbers compiler scratch registers, the handler carefully
  preserves not just `ACC`/`B`/`DPH`/`DPL`/`PSW` but also `R0`, `R1`, `ar6`, `ar7` into dedicated
  fixed memory (`0x33–0x36`) before running, then restores them.
- Shared-variable updates are wrapped in **`__critical { }`** blocks (and `EA` is cleared inside
  the kernel) so a preemption can't corrupt data mid-update.

---

## Checkpoint 3 — Semaphores & Bounded Buffer
`112006233_ppc3/` — `preemptive.c` · `preemptive.h` · `testpreempt.c`

The single shared byte is replaced with a proper **3-deep circular bounded buffer** guarded by
**three counting semaphores**, following the classic producer–consumer pattern:

| Semaphore | Addr | Init | Meaning |
|-----------|------|------|---------|
| `mutex` | `0x20` | 1 | Protects buffer access |
| `full` | `0x21` | 0 | Filled slots available to consume |
| `empty` | `0x22` | 3 | Free slots available to produce |

Buffer at `0x25–0x27`, with `head` (`0x23`) and `tail` (`0x24`) wrapping at 3. The semaphore
operations live in [`preemptive.h`](ppc4/preemptive.h) as **inline-assembly macros** (zero call
overhead):
- `SemaphoreSignal` is a single atomic `INC`.
- `SemaphoreWait` is a short busy-wait (`MOV`/`JZ`/`JB ACC.7`/`DEC`). A `__COUNTER__` trick gives
  every use site a unique assembly label so the macro can be expanded many times per file without
  label collisions.

Busy-waiting is safe here precisely *because* the kernel is preemptive: a thread spinning inside
`SemaphoreWait` is periodically preempted by the timer, letting the other thread make progress and
update the count — so the spin never deadlocks the system.

---

## Checkpoint 4 — Two Producers, One Consumer & Fairness
`ppc4/` — [`preemptive.c`](ppc4/preemptive.c) · [`test3threads.c`](ppc4/test3threads.c)

The preemptive kernel and semaphores from CP3 are reused **unchanged**; only the test app is new.
Now there are **three threads**: Producer1 (Thread 0, letters `A–Z`), Consumer (Thread 1), and
Producer2 (Thread 2, digits `0–9`), all sharing one bounded buffer. Since both producers write
`tail`, the write + increment is kept inside the `mutex` critical section.

This checkpoint studies **fairness**, toggled by a `FAIR` compile-time flag:

- **`FAIR = 0` (round-robin, unfair):** the UART prints only `ABCDE…` — Producer2 is completely
  **starved**. Whichever producer keeps winning the race for freed `empty` slots monopolizes the
  buffer; the other spends its whole time slice spinning in `SemaphoreWait(empty)`. This is genuine
  starvation, not deadlock — the system stays live and output is still correct for one producer.
- **`FAIR = 1` (starvation-free):** a single `volatile` turn flag `prod_turn` (`0x2B`) alternates
  the two producers. Each waits for its turn, produces one item, then hands the turn to the other.
  Output becomes the fair, interleaved `A0B1C2D3E4…`. A single byte is used instead of extra
  semaphores on purpose — a byte read/write is one atomic 8051 instruction, and it lives in the
  manually reserved memory block so the compiler's scratch area can't clobber it (an earlier
  two-semaphore attempt deadlocked for exactly that reason).

---

## Checkpoint 5 — Peripherals & the Dinosaur Game
`ppc5/` — [`testlcd.c`](ppc5/testlcd.c) · [`dino.c`](ppc5/dino.c) · driver libs `buttonlib.*`, `keylib.*`, `lcdlib.*`

The final checkpoint takes the threading core into the physical world, driving three EdSim51
peripherals through small device drivers:

- **Button bank** (`buttonlib`) — 8 switches on port `P2`; a press pulls a bit low.
- **Numeric keypad** (`keylib`) — a 4×3 matrix scanned row-by-row over port `P0` (requires the
  simulator's *AND-Gate Enabled* option).
- **LCD** (`lcdlib`) — a 2×16 HD44780 module in 4-bit mode, with custom CG-RAM glyphs.

### Part 1 — Peripherals as producers/consumer (`testlcd.c`)
The two-producer / one-consumer structure from CP4 is re-wired to real hardware: a **button-bank
producer** and a **keypad producer** each edge-detect presses (one character enqueued per press,
no auto-repeat until release) and push into a 3-slot ring buffer; an **LCD consumer** dequeues and
displays each character once `LCD_ready()` is true. Scheduling here is deliberately **cooperative**
(`ET0` cleared so Timer 0 never preempts, each thread `ThreadYield()`s once per pass) so that a
switch only happens at a shallow point — keeping the 13-byte context frame safely inside the
16-byte per-thread stack even though the LCD/keypad calls nest several levels deep. Ring access is
**non-blocking**: a producer that finds the ring full simply skips the round, so `SemaphoreWait`
on the lock never spins.

### Part 2 — Dinosaur game (`dino.c`)
A cactus-dodging game implemented as **three cooperative threads**:

- **`main` (game logic)** — reads difficulty (`0–9` then `#`), moves the dino between the two rows
  on keys `2`/`8`, slides cacti left each frame, scores dodges, and detects collisions.
- **`pad_thread`** — edge-detects keypad presses into a one-slot mailbox.
- **`draw_thread`** — owns the LCD and repaints from a snapshot of the world each frame.

Two engineering details stand out:
- **The map is stored as bits, not bytes.** Each 16-column row is a single `unsigned int` bitmask
  (`row0`, `row1`); a cactus slide is just a `>>= 1`. This is essential given how little RAM the
  8051 has.
- **Zero C auto-locals in the game.** Because all threads share register bank 0, SDCC would place
  C locals in low IRAM and risk overrunning game state, so **every variable is pinned to a fixed
  `__data __at` address** and helper functions avoid locals entirely — a deliberate workaround for
  SDCC's absolute-register (`ar`) behavior across register-bank switches.

Difficulty scales the number of yields per frame; new cacti are generated with a tiny LFSR
(`lrng`) and spaced so the wall is always passable. On a collision the game switches to a
`Game Over` screen showing the score (formatted to decimal without a divide instruction).

---

## Building & Running

### Prerequisites
- [SDCC](http://sdcc.sourceforge.net/) (Small Device C Compiler)
- [EdSim51](https://www.edsim51.com/) 8051 simulator

### Build
Each checkpoint folder has its own `Makefile`. For example:

```bash
cd ppc4
make            # produces test3threads.hex
# make clean    # removes build artifacts
```

`ppc5` builds two images — `testlcd.hex` (Part 1) and `dino.hex` (the game) — and needs the
`--model-small` flag plus the peripheral driver objects, all handled by its `Makefile`.

> **Note:** `Makefile` recipes must be indented with **tabs**, not spaces.

### Run in EdSim51
1. Load the generated `.hex` file into EdSim51.
2. Run. Output is transmitted over the simulated **UART** (open the serial pane).
3. To confirm which thread is executing, set a breakpoint, then check the **PC** against the
   `.map` file plus the **PSW** bank bits and **SP** range (see [Core Design](#core-design)).

---

## Memory Map (internal RAM)

| Address | Used for |
|---------|----------|
| `0x20–0x22` | Semaphores: `mutex`, `full`, `empty` (CP3+) |
| `0x23–0x24` | Bounded-buffer `head` / `tail` (CP3+) |
| `0x25–0x27` | 3-slot circular buffer (CP3+) |
| `0x28–0x2B` | Per-thread working chars + `prod_turn` fair flag (CP4) |
| `0x30–0x32` | Cooperative shared buffer + flag (CP1) |
| `0x33–0x36` | Saved `R0`/`R1`/`ar6`/`ar7` for the timer ISR (CP2+) |
| `0x38–0x3F` | Kernel state: `active_thread`, `thread_mask`, `saved_sp[]`, temporaries |
| `0x3F + ID×16` | Base of each thread's 16-byte stack |

---

## Concepts Demonstrated
Context switching · cooperative vs. preemptive scheduling · interrupt-driven timeslicing ·
register-bank-per-thread stack management · counting semaphores · the bounded-buffer problem ·
critical sections & atomicity · thread starvation vs. deadlock · fairness · memory-mapped I/O
and device drivers (button bank, matrix keypad, HD44780 LCD) · bit-packed game state ·
bare-metal C on a 128-byte 8051.
