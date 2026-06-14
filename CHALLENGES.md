# Code Challenges

Each challenge maps to the 8-week prep plan. Implement in order; tests are your pass/fail gate.

---

## Challenge 01 — Thread-Safe Token Box (Week 1)

**File:** `Challenges/01_TokenBox/ActorTokenStore.swift`  
**Time:** 25 min

Implement `TokenStoring` using an `actor` (or justify `NSLock`).

**Edge cases:** concurrent get during clear; multiple set calls.

---

## Challenge 02 — Debounced Search (Week 1)

**File:** `Challenges/02_DebouncedSearch/SearchViewModel.swift`  
**Time:** 35 min

300ms debounce, cancel in-flight search, empty query clears without network.

**Edge cases:** fast typing; stale result after cancellation.

---

## Challenge 03 — Retry with Backoff (Week 1)

**File:** `Challenges/03_Retry/Retry.swift`  
**Time:** 30 min

Exponential backoff: 0.5s → 1s → 2s. Respect cancellation. No retry on 401.

---

## Challenge 04 — NetworkClient (Week 2)

**Files:** `Core/Network/*`, `Challenges/04_NetworkClient/URLSessionNetworkClient.swift`  
**Time:** 45 min

Map status codes, decode JSON, map URLError to typed errors.

---

## Challenge 05 — AuthCoordinator (Week 2)

**File:** `Challenges/05_AuthCoordinator/AuthCoordinator.swift`  
**Time:** 45 min

Single-flight refresh on 401. 10 parallel 401s → 1 refresh. Logout clears in-flight work.

---

## Challenge 06 — LRU Cache (Week 3)

**File:** `Challenges/06_LRUCache/LRUCache.swift`  
**Time:** 40 min

O(1) get/set. Apply to cache hotel search responses.

---

## Challenge 07 — Paginated Feed (Week 3)

**File:** `Challenges/07_PaginatedFeed/PaginatedFeedViewModel.swift`  
**Time:** 45 min

Cursor pagination, prefetch at -5 from end, refresh without duplicates.

---

## Challenge 08 — Image Loader (Week 3)

**File:** `Challenges/08_ImageLoader/ImageLoader.swift`  
**Time:** 35 min

Memory cache, in-flight coalescing per URL, reuse token in cell configure.

---

## Challenge 09 — Trip State Machine (Week 4, Uber)

**File:** `Challenges/09_TripStateMachine/TripController.swift`  
**Time:** 40 min

Valid transitions only; handle out-of-order events.

---

## Challenge 10 — Subscription Manager (Week 7, RevenueCat)

**File:** `Challenges/10_SubscriptionManager/SubscriptionManager.swift`  
**Time:** 50 min

State machine: free → trial → active → billingRetry → expired. Restore flow.
