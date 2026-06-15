# Day 1 — Completion Guide

**Date started:** Jun 15  
**Challenge 01:** ✅ Done (`ActorTokenStore` — all tests green)

Work through the blocks below in order. Check each box when done, then update `PROGRESS.md` and commit.

---

## Checklist

| Block | Time | Task | Done |
|-------|------|------|------|
| **A** | 90m | LeetCode: Two Sum + Valid Parentheses (timed 25m each) | ⬜ |
| **B** | 90m | Challenge 01 — ActorTokenStore | ✅ |
| **C** | 60m | Read `Concurrency-Notes.md` + write 5 bullets in your own words | ⬜ |
| **D** | 60m | Study `SystemDesign/Hotel-Booking-Architecture.md` → redraw from memory on paper | ⬜ |
| **E** | 60m | Fill STAR 1 in `STAR-Day1.md` → practice 2 min out loud | ⬜ |

**Optional stretch:** Skim `LeetCode-Solutions.md` only **after** you attempt both problems without hints.

---

## Block A — LeetCode (do this yourself, timed)

### Two Sum (25 min timer)

**Problem:** Given `nums` and `target`, return indices `[i, j]` where `nums[i] + nums[j] == target`.

**Before coding, say:**
> "I'll use a hash map storing value → index. For each number, check if `target - num` exists in the map. O(n) time, O(n) space."

**Edge cases to mention:** duplicate values, negative numbers, exactly one solution exists.

### Valid Parentheses (25 min timer)

**Problem:** String of `()[]{}` — return true if valid.

**Before coding, say:**
> "Stack-based. Push opening brackets; on closing, pop and verify match. O(n) time, O(n) space."

**Edge cases:** empty string → true, single char → false, wrong order `"(]"`.

---

## After Day 1

1. Mark checkboxes in this file and `PROGRESS.md` Day 1 row.
2. Add hours spent to `PROGRESS.md`.
3. Commit:
```bash
git add PREP/Day01/ SystemDesign/Hotel-Booking-Architecture.md PROGRESS.md
git commit -m "Day 1 complete: LC, concurrency notes, hotel booking design, STAR 1"
git push
```

**Tomorrow = Day 2:** Merge Two Sorted Lists, Contains Duplicate, start Challenge 02.
