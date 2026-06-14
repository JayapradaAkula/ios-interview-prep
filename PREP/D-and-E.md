# Block D & E — System Design, Behavioral, Company Drills

Daily **Block D** (60 min): system design OR STAR behavioral.  
Daily **Block E** (60–90 min): company-specific drill (Uber, Life360, RevenueCat, Zillow).

Split Block D across the week:

| Day | Block D focus |
|-----|----------------|
| Mon / Wed | System design (45 min draw + 15 min tradeoffs) |
| Tue / Thu | STAR behavioral (10 min write + 20 min speak + 30 min refine) |
| Fri | Mixed: 30 min design + 30 min STAR |
| Sun | Mock: 45 min design + 15 min behavioral follow-ups |

---

## System Design Framework (8 steps — memorize)

Use this order every time. Say each step out loud before drawing.

### Step 1 — Clarify requirements (5 min)

**Functional**
- Core user flows?
- Read vs write ratio?
- Real-time or batch?
- Offline required?

**Non-functional**
- Scale: DAU, requests/sec, data size?
- Latency target (p95)?
- Availability (99.9% vs 99.99%)?
- Security/compliance (PCI, GDPR, kids' privacy)?

**Example script (IHG-style booking):**
> "I'll design hotel search and booking for a global consumer app. Assumptions: 5M DAU, search-heavy, booking must be reliable, support offline draft saves, and PCI for payments. p95 search under 300ms on good network."

### Step 2 — High-level architecture (5 min)

```
SwiftUI/UIKit → ViewModel/Presenter → Repository → Network / Cache / Local DB
                                              ↓
                                    Auth Interceptor → Keychain
                                              ↓
                                    Feature Flags + Observability
```

> "I separate UI from domain logic via ViewModels. Repositories hide whether data comes from cache, disk, or network. Auth is an interceptor, not scattered in every API call."

### Step 3 — API design (5 min)

- REST vs GraphQL — justify choice
- Pagination: cursor vs offset
- Idempotency keys for payments/booking
- Versioning (`/v2/`)
- Error contract: `{ code, message, retryable }`

| Use cursor when | Use offset when |
|-----------------|-----------------|
| Feed changes frequently | Static admin lists |
| Large datasets | Small, stable sets |
| Duplicate risk on refresh | Simple page numbers OK |

### Step 4 — Data model (5 min)

| Local | Remote |
|-------|--------|
| User session, drafts | Source of truth for bookings |
| Cached search results | Loyalty points (server authoritative) |
| Image cache | Listing catalog |

**Rule:** Server wins for money, points, inventory. Local wins for UX speed and offline drafts.

### Step 5 — Caching strategy (5 min)

| Tier | Tool | TTL | Use |
|------|------|-----|-----|
| L1 Memory | NSCache | Minutes | Images, hot API responses |
| L2 Disk | File / URLCache | Hours | Search results, listing detail |
| L3 Network | — | — | Fresh or stale-while-revalidate |

**Invalidation triggers:**
- Logout → clear all
- User profile change → invalidate user-scoped cache
- POST/PUT/DELETE → invalidate related keys
- Feature flag flip → invalidate feature-specific cache

### Step 6 — Auth & security (5 min)

| Asset | Storage | Why |
|-------|---------|-----|
| Access token | Memory only | Short-lived |
| Refresh token | Keychain | Encrypted, survives restart |
| User prefs | UserDefaults | Non-sensitive only |

**Must mention:**
- Single-flight token refresh (10 parallel 401s → 1 refresh)
- Certificate pinning for payment flows
- No PII in logs

### Step 7 — Reliability & observability (5 min)

| Area | What to say |
|------|-------------|
| Crashes | Symbolicated crash reports, bucket by release |
| Metrics | Booking funnel: search → select → pay → confirm |
| Feature flags | LaunchDarkly kill switch before hotfix |
| Hotfix | Branch → test → staged rollout → rollback path |
| Incidents | RCA: timeline, root cause, action items |

**Booking funnel metrics:**
```
search_started → results_shown → hotel_selected →
guest_details → payment_started → payment_success → confirmation
```

### Step 8 — Tradeoffs (5 min)

Always end with 2 tradeoffs.

> "I chose GraphQL for the home screen because one round-trip beats 4 REST calls, but search stays REST for simpler caching. I chose cursor pagination because hotel inventory changes during scroll."

---

## 6 System Designs (practice outlines)

### Design 1 — IHG Hotel Booking App

**Requirements:** Search, details, book+pay (PCI), loyalty points, 5M DAU, 99.9% availability.

**Key flows:** Paginated search (cursor) → image-heavy detail → local booking draft → idempotent payment → confirmation.

**Deep dives:** Double booking prevention, price change at checkout, token expires during payment.

**Your hook:** Hotfix pipeline + AppDynamics on booking funnel.

### Design 2 — Uber Real-Time Trip Tracking

**Requirements:** Request, match, live ETA, complete/cancel; poor network tolerance.

**Architecture:** REST for state transitions; WebSocket for location/ETA; local state machine.

**Deep dives:** Out-of-order events (version numbers), reconnect replay, battery (throttle map not GPS ingestion), double-tap idempotency.

### Design 3 — Life360 Family Safety

**Requirements:** Family circle, live map, geofence, SOS, battery-conscious.

**Architecture:** Background location, push for geofence, local last-known when offline.

**Deep dives:** Privacy tiers, iOS background limits, geofence hysteresis, COPPA for minors.

### Design 4 — RevenueCat-Style Subscription Client

**State machine:** `unknown → free → trial → active → billingRetry → expired`

**Deep dives:** StoreKit 2 `Transaction` listener, server receipt validation, restore, Family Sharing, interrupted purchase.

**API surface:**
```swift
protocol SubscriptionManager {
    func currentStatus() async -> SubscriptionStatus
    func purchase(productID: String) async throws
    func restore() async throws
}
```

### Design 5 — Zillow Property Search

**Requirements:** Search + filters, map bounds, infinite scroll, save homes, image-heavy.

**Deep dives:** Map/list single repository, pin clustering, stale listing badge, mortgage calculator local.

### Design 6 — Offline-First Loyalty Wallet

**Architecture:** Core Data catalog cache, outbox redeem queue, server balance authoritative.

**Deep dives:** Optimistic UI with rollback, queue ordering, encrypted wipe on logout.

---

## STAR Stories (8 — practice 2 min and 5 min versions)

Every story needs a **metric** in the Result. Replace placeholders with your real numbers.

### STAR 1 — IHG Production Booking Incident

| | |
|---|---|
| **S** | Critical failures in IHG global booking during high traffic; customers couldn't complete reservations. |
| **T** | Lead triage, minimize impact, restore stability, prevent recurrence. |
| **A** | Incident bridge; AppDynamics funnel tracing; identified payment confirmation API failure; hotfix with QA gates; RCA with timeline; funnel metrics at each step. |
| **R** | Restored booking success rate; reduced MTTR; improved release confidence. *(Add: MTTR X→Y, success rate %)* |

**Follow-ups:** Hotfix vs root cause priority? Communication to support? Guardrails added?

### STAR 2 — Crash Monitoring + Hotfix Pipeline (IHG)

| | |
|---|---|
| **S** | Inconsistent crash visibility and rollback discipline on mobile releases. |
| **T** | Establish monitoring, hotfix path, team release standards. |
| **A** | Crash bucketing by release; hotfix branch protocol; AppDynamics; DevOps release gates; incident playbooks. |
| **R** | Team-wide adoption; faster detection; fewer booking/loyalty regressions. |

### STAR 3 — Macy's ObjC → Swift VIPER Migration

| | |
|---|---|
| **S** | Legacy Macy's iOS: large ObjC MVC, high traffic, squads blocked by coupling. |
| **T** | Modernize without stopping features or downtime. |
| **A** | VIPER modules; incremental migration; REST → xAPI/Protobuf; CocoaPods standardization; parallel squads. |
| **R** | Zero-downtime migration; parallel shipping; smaller payloads / lower latency. |

**Tradeoff:** "VIPER added boilerplate but enabled 4 squads to ship independently."

### STAR 4 — Best Buy Networking Test Coverage

| | |
|---|---|
| **S** | Integration defects escaped from networking layer to production. |
| **T** | Raise quality via testable architecture. |
| **A** | Quick/Nimble; DI into ViewModels; mocked network at repository; success + failure paths; shared team pattern. |
| **R** | Reduced defect escape rate before QA. *(Add % if available)* |

### STAR 5 — LaunchDarkly Controlled Rollout (IHG)

| | |
|---|---|
| **S** | Full deploy risk for booking/loyalty UX experiments. |
| **T** | Ship experiments safely with kill switch. |
| **A** | LaunchDarkly integration; flag ownership; staged % rollout; kill switch tested; Adobe A/B for conversion. |
| **R** | Data-driven optimization without full deploy per experiment. |

### STAR 6 — Release Gate Conflict (Product vs Quality)

| | |
|---|---|
| **S** | Product wanted feature in release; QA found loyalty regression near deadline. |
| **T** | Balance schedule vs stability. |
| **A** | Presented crash + funnel data; flag-off proposal; risk matrix; PM/QA/DevOps alignment. |
| **R** | Stable release shipped; feature launched behind flag next sprint. |

### STAR 7 — 0→1 App Store (Frog Dissection)

| | |
|---|---|
| **S** | Built educational iPad app from zero. |
| **T** | Full ownership: architecture through App Store lifecycle. |
| **A** | Classroom UX; signing/provisioning/privacy; iterative updates. |
| **R** | IEAR Best Science App; Apple New & Noteworthy; Sunday Times Top 500. |

### STAR 8 — Mentoring / Team Standards

| | |
|---|---|
| **S** | Inconsistent architecture and code review depth. |
| **T** | Raise bar via practices. |
| **A** | Review checklist; MVVM/VIPER docs; pairing; testing template from Best Buy work. |
| **R** | Consistent PR quality; faster onboarding; fewer arch regressions. |

### Amazon Leadership Principles map

| LP | Story |
|----|-------|
| Customer Obsession | STAR 1 |
| Ownership | STAR 7 |
| Invent and Simplify | STAR 3 |
| Insist on Highest Standards | STAR 4, 6 |
| Deliver Results | STAR 2 |
| Dive Deep | STAR 1 |
| Bias for Action | STAR 5 |
| Earn Trust | STAR 6 |

---

## Block E — Company Drill Packs

| Day | Company | Focus |
|-----|---------|--------|
| Mon | Uber | Real-time, maps, state machines |
| Tue | Life360 | Location, background, privacy |
| Wed | RevenueCat | StoreKit, SDK design, subscriptions |
| Thu | Zillow | Search, filters, images |
| Fri | FAANG / mixed | Hard LC + design redo |

### Uber — 60 min drill

1. Draw trip state diagram (15 min)
2. Implement/explain `TripController` (20 min)
3. List 10 edge cases aloud (10 min)
4. "Network drops 30s during inProgress — what does UI show?" (15 min)

**Key concepts:** State machine, idempotent request, WebSocket ETA, map flicker prevention, payment failure mid-trip.

### Life360 — 60 min drill

1. Draw location → batch upload → server → push (15 min)
2. Battery optimization tradeoffs (15 min)
3. Privacy: on-device vs server (15 min)
4. Edge cases: permission denied, app killed, COPPA (15 min)

### RevenueCat — 60 min drill

1. Subscription state machine (15 min)
2. Challenge 10 or mock API walkthrough (25 min)
3. Client vs server validation (10 min)
4. Public error enum design (10 min)

**StoreKit 2 flow:** Load products → buy → transaction → verify server → unlock → finish transaction.

### Zillow — 60 min drill

1. Search + filter + map architecture (20 min)
2. Pagination + prefetch (15 min)
3. Image pipeline thumbnail → detail (15 min)
4. Edge cases: zero results, stale listing, map debounce (10 min)

### FAANG Friday

- Redo one design blind (45 min)
- One hard LC (mobile-relevant)
- Production debug scenario: "3% crash spike, iOS 17 only, booking screen"

---

## Weekly D+E rotation

| Week | Mon E | Tue E | Wed E | Thu E | Fri E |
|------|-------|-------|-------|-------|-------|
| 1 | Uber state machine | Life360 location | RevenueCat SK2 | Zillow search | STAR 1+2 |
| 2 | Uber idempotency | Life360 geofence | RevenueCat restore | Zillow filters | Design: booking auth |
| 3 | Uber WebSocket | Life360 battery | Billing retry | Zillow images | STAR 3+4 |
| 4 | Full Uber design | Life360 privacy | RevenueCat SDK API | Zillow map/list | STAR 5+6 |
| 5 | Mock Uber 60m | Mock Life360 | Mock RevenueCat | Mock Zillow | FAANG design |
| 6 | Design: IHG | Design: Uber | Design: Life360 | Design: RevenueCat | Design: Zillow |
| 7 | Company deep + STAR | — | — | — | Full mock |
| 8 | 4× full mocks | — | — | — | — |

---

## End-of-day checklist (5 min)

1. What did I **ship**? (commit hash or LC problem)
2. What **test** turned green?
3. What **edge case** did I learn?
4. What is **first task tomorrow**?
5. Did I **talk out loud** 5+ minutes?
