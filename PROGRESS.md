# Interview Prep Progress Tracker

**Candidate:** Jayaprada Akula  
**Target:** FAANG, Uber, Zillow, Life360, RevenueCat  
**Daily commitment:** 4–6 hours  

Update this file at end of each day. Commit with: `git commit -m "Progress: Week X Day Y"`

---

## Weekly Gates (do not advance until met)

| Week | Gate | Status |
|------|------|--------|
| 1 | Challenges 01–03 tests green | 🔄 (01 done) |
| 2 | Challenges 04–05 tests green | ⬜ |
| 3 | Challenges 06–08 tests green | ⬜ |
| 4 | Challenge 09 green + UI flow notes | ⬜ |
| 5 | 15 LC mediums completed | ⬜ |
| 6 | 6 system designs from memory | ⬜ |
| 7 | Challenge 10 green + company drills | ⬜ |
| 8 | 4 full mock interviews done | ⬜ |

---

## Challenge Checklist

| # | Challenge | Test filter | Done |
|---|-----------|-------------|------|
| 01 | Thread-Safe Token Box | `Challenge01` | ✅ |
| 02 | Debounced Search | `Challenge02` | ⬜ |
| 03 | Retry with Backoff | `Challenge03` | ⬜ |
| 04 | NetworkClient | `Challenge04` | ⬜ |
| 05 | AuthCoordinator | `Challenge05` | ⬜ |
| 06 | LRU Cache | `Challenge06` | ⬜ |
| 07 | Paginated Feed | `Challenge07` | ⬜ |
| 08 | Image Loader | `Challenge08` | ⬜ |
| 09 | Trip State Machine | `Challenge09` | ⬜ |
| 10 | Subscription Manager | `Challenge10` | ⬜ |

```bash
swift test --filter Challenge01   # replace number
```

---

## STAR Stories Checklist

| # | Story | 2 min practiced | 5 min practiced |
|---|-------|-----------------|-----------------|
| 1 | Hotel booking incident | ⬜ | ⬜ |
| 2 | Crash monitoring + hotfix | ⬜ | ⬜ |
| 3 | Retail VIPER migration (previous employer) | ⬜ | ⬜ |
| 4 | Connected-home network tests (previous employer) | ⬜ | ⬜ |
| 5 | LaunchDarkly rollout | ⬜ | ⬜ |
| 6 | Release gate conflict | ⬜ | ⬜ |
| 7 | Educational App Store app 0→1 | ⬜ | ⬜ |
| 8 | Mentoring / standards | ⬜ | ⬜ |

---

## System Design Checklist

| # | Design | Drawn from memory | Timed 45 min |
|---|--------|-------------------|--------------|
| 1 | Hotel booking app | ⬜ | ⬜ |
| 2 | Uber trip tracking | ⬜ | ⬜ |
| 3 | Life360 family safety | ⬜ | ⬜ |
| 4 | RevenueCat subscriptions | ⬜ | ⬜ |
| 5 | Zillow property search | ⬜ | ⬜ |
| 6 | Offline loyalty wallet | ⬜ | ⬜ |

---

## LeetCode Tracker (target: 75–90 total, 25–30 blindable)

| Week | Target problems | Completed | Notes |
|------|-----------------|-----------|-------|
| 1 | 14 easy | | |
| 2 | 10 easy + 4 moderate | | |
| 3 | 8 moderate | | |
| 4 | 8 moderate | | |
| 5 | 6 hard | | |
| 6 | 6 moderate (design week) | | |
| 7–8 | 15 mixed blind redo | | |

---

## 8-Week Daily Log

Copy a row per day. Fill `Hours`, `LC`, `Challenge`, `D`, `E`, `Notes`.

### Week 1 — Swift + Concurrency + Easy LC

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 1 | Jun 15 | | Two Sum, Valid Parens | ⬜ | 01 | ✅ | Hotel booking arch sketch | STAR 1 bullets | See `PREP/Day01/` for rest of Day 1 |
| 2 | | | Merge Lists, Contains Dup | ⬜ | — | ⬜ | MVVM vs VIPER | Retail migration story | |
| 3 | | | Max Subarray, Stock | ⬜ | — | ⬜ | Hotfix pipeline | Uber eng blog | |
| 4 | | | Reverse LL, FizzBuzz | ⬜ | — | ⬜ | Search hotels reqs | Life360 research | |
| 5 | | | Debounce/throttle LC | ⬜ | 02 | ⬜ | STAR 1 draft | Record STAR 1 | |
| 6 | | | Group Anagrams, Top K | ⬜ | — | ⬜ | Paginated list API | Zillow UX | |
| 7 | | | Review week problems | ⬜ | 03 | ⬜ | Mock easy LC | Week 1 retro | |

### Week 2 — Networking, JWT, Auth

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 8 | | | Binary Search | ⬜ | 04 | ⬜ | Auth layer diagram | RevenueCat docs | |
| 9 | | | Valid BST, Level Order | ⬜ | — | ⬜ | Keychain flow | STAR 4 | |
| 10 | | | Number of Islands | ⬜ | 05 | ⬜ | 401 edge cases | Logout cascade | |
| 11 | | | Clone Graph | ⬜ | — | ⬜ | AppError mapping | Retry tests | |
| 12 | | | LRU Cache | ⬜ | — | ⬜ | Session expires checkout | Uber networking | |
| 13 | | | Min Stack, RPN | ⬜ | — | ⬜ | Repository pattern | GraphQL vs REST | |
| 14 | | | Redo LRU blind | ⬜ | 05 | ⬜ | Auth interceptor mock | E2E auth test | |

### Week 3 — Caching + Pagination

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 15 | | | Product Except Self | ⬜ | — | ⬜ | Cache invalidation | Zillow images | |
| 16 | | | Longest Substring | ⬜ | — | ⬜ | URLCache config | Cell reuse race | |
| 17 | | | 3Sum | ⬜ | — | ⬜ | Offline-first | Life360 offline | |
| 18 | | | Coin Change | ⬜ | — | ⬜ | Offline booking sync | Sync flow draw | |
| 19 | | | Word Break | ⬜ | — | ⬜ | Conflict resolution | Cache XCTest | |
| 20 | | | Rotting Oranges | ⬜ | 07 | ⬜ | Infinite scroll feed | PaginatedLoader | |
| 21 | | | Week review | ⬜ | 06, 08 | ⬜ | Mock Zillow cache | Cache README | |

### Week 4 — UI Live Coding

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 22 | | | Queue via Stacks | ⬜ | — | ⬜ | Listing detail states | SwiftUI List | |
| 23 | | | Kth Largest | ⬜ | — | ⬜ | STAR booking triage | Skeleton UI | |
| 24 | | | Merge Intervals | ⬜ | — | ⬜ | Checkout form UX | Keyboard | |
| 25 | | | LCA BST | ⬜ | — | ⬜ | VIPER module | Retail app slice | |
| 26 | | | Serialize BST | ⬜ | 09 | ⬜ | Deep linking | Trip state UI | |
| 27 | | | Connected Components | ⬜ | — | ⬜ | Map + list split | CoreLocation | |
| 28 | | | UI LC redo | ⬜ | 09 | ⬜ | Mock UI 60m | Record demo | |

### Week 5 — Hard LC + Advanced iOS

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 29 | | | Word Search | ⬜ | — | ⬜ | Life360 real-time | WebSocket stub | |
| 30 | | | Trapping Rain | ⬜ | — | ⬜ | Parallel downloads | Uber map tiles | |
| 31 | | | Merge K Lists | ⬜ | — | ⬜ | STAR LaunchDarkly | Feature flags | |
| 32 | | | Longest Consecutive | ⬜ | — | ⬜ | Memory leaks | Instruments | |
| 33 | | | Implement Trie | ⬜ | — | ⬜ | Typeahead API | Autocomplete | |
| 34 | | | Pacific Atlantic | ⬜ | — | ⬜ | Background upload | BGTask notes | |
| 35 | | | 2 hard timed | ⬜ | — | ⬜ | Download manager | LC contest | |

### Week 6 — System Design Marathon

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 36 | | | House Robber | ⬜ | — | ⬜ | Design: hotel booking | Final diagram | |
| 37 | | | Decode Ways | ⬜ | — | ⬜ | Design: loyalty wallet | Funnel metrics | |
| 38 | | | Unique Paths | ⬜ | — | ⬜ | Design: Uber trip | State sync | |
| 39 | | | Partition Subset | ⬜ | — | ⬜ | Design: RevenueCat | StoreKit 2 | |
| 40 | | | Graph Valid Tree | ⬜ | — | ⬜ | Design: Life360 | Geofencing | |
| 41 | | | 1 medium | ⬜ | — | ⬜ | Design: Zillow | Image CDN | |
| 42 | | | Weak LC redo | ⬜ | — | ⬜ | 2 designs back-to-back | Design playbook | |

### Week 7 — Company Deep Dives

| Day | Date | Hours | LeetCode | LC ✅ | Challenge | Tests ✅ | Block D | Block E | Notes |
|-----|------|-------|----------|-------|-----------|----------|---------|---------|-------|
| 43 | | | 1 medium | ⬜ | — | ⬜ | Uber ride flow | Uber principles | |
| 44 | | | 1 medium | ⬜ | — | ⬜ | Uber payment fail | STAR for Uber | |
| 45 | | | BFS/DFS | ⬜ | — | ⬜ | Life360 geofence | Background modes | |
| 46 | | | 1 medium | ⬜ | — | ⬜ | Life360 hybrid API | Edge cases | |
| 47 | | | 1 medium | ⬜ | 10 | ⬜ | RevenueCat subs | Receipt validation | |
| 48 | | | 1 medium | ⬜ | 10 | ⬜ | SDK public API | Family sharing | |
| 49 | | | 1 medium | ⬜ | — | ⬜ | Zillow mortgage | Thumbnail strategy | |
| 50 | | | 3 LC redo | ⬜ | — | ⬜ | Mock pick company | App store research | |

### Week 8 — Mock Interviews

| Day | Date | Hours | Mock type | Passed? | Weak areas | Retest date | Notes |
|-----|------|-------|-----------|---------|------------|-------------|-------|
| 51 | | | LC + iOS + Zillow design + behavioral | ⬜ | | | |
| 52 | | | LC + iOS + Uber design + behavioral | ⬜ | | | |
| 53 | | | LC + iOS + RevenueCat + behavioral | ⬜ | | | |
| 54 | | | LC + iOS + Life360 + behavioral | ⬜ | | | |
| 55 | | | 4 mediums blitz | ⬜ | | | |
| 56 | | | Repo polish + rest | ⬜ | | | |

---

## Sunday Scorecard (copy weekly)

```
Week __ Scorecard
─────────────────────────────────
LeetCode:        __ / 7 problems
Challenges done: __ / target
Tests green:     Challenge __ through __
System designs:  __ / target
STAR stories:    __ practiced aloud
Mock interviews: __
Total hours:     __
Next week focus: __
```

---

## Red Flags

- 3+ days with 0 LeetCode → algorithm risk
- Commits but tests still red → not finishing
- Only reading, no `swift test` → interview gap
- No STAR practice for 2 weeks → leadership rounds hurt
