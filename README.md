# iOS Interview Prep

FAANG-level iOS interview practice repo for **Jayaprada Akula** — networking, auth, caching, concurrency, UI patterns, and company-specific modules 

## Quick Start

```bash
cd ~/Projects/ios-interview-prep
swift build
swift test
```

Open in Xcode: `open Package.swift`

## Structure

```
Sources/iOSInterviewPrep/
├── Core/           # Shared protocols, models, infrastructure
└── Challenges/     # One folder per challenge — implement TODOs here

Tests/iOSInterviewPrepTests/
├── Core/
└── Challenges/     # Failing tests until you implement each challenge
```

## How to Practice

1. Read `CHALLENGES.md` for the challenge spec and edge cases.
2. Open the matching folder under `Challenges/`.
3. Implement the `TODO` items (remove stub returns / `fatalError`).
4. Run `swift test --filter Challenge01` (or the matching filter).
5. Explain your solution out loud in 5 minutes (interview simulation).

## Challenge Index

| # | Topic | Filter |
|---|--------|--------|
| 01 | Thread-safe Token Box | `Challenge01` |
| 02 | Debounced Search | `Challenge02` |
| 03 | Retry with Backoff | `Challenge03` |
| 04 | NetworkClient | `Challenge04` |
| 05 | AuthCoordinator (single-flight refresh) | `Challenge05` |
| 06 | LRU Cache | `Challenge06` |
| 07 | Paginated Feed | `Challenge07` |
| 08 | Image Loader + reuse safety | `Challenge08` |
| 09 | Trip State Machine (Uber) | `Challenge09` |
| 10 | Subscription Manager (RevenueCat) | `Challenge10` |

## Daily Workflow (4–6 hrs)

| Block | Time | Action |
|-------|------|--------|
| A | 90m | LeetCode (see 8-week plan) |
| B | 90m | 1–2 challenges from this repo |
| C | 60m | Read WWDC / docs |
| D | 60m | System design whiteboard |

See `CHALLENGES.md` for specs and `PROGRESS.md` for your daily tracker. Block D & E prep (system design, STAR, company drills) lives in `PREP/D-and-E.md`.
