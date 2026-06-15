# Day 1 — STAR Stories

## STAR 1 — Hotel Booking Production Incident (Block E)

Fill in **your real numbers** where marked `[METRIC]`. Practice **2 min** out loud without reading.

*Personal interview prep — generic labels; use verbal interviews for employer-specific names if needed.*

### Bullets (memorize structure)

| | Your notes |
|---|------------|
| **S** | Global hotel booking app (previous employer) — critical failure during `[peak period / release / traffic event]`. Customers could not complete reservations. Impact: `[X]%` booking failure or `[Y]` failed transactions/hour. |
| **T** | As mobile lead, own incident triage, restore booking flow, minimize customer impact, prevent recurrence. |
| **A** | • Led incident bridge with eng, QA, product, support<br>• Used AppDynamics to trace funnel drop-off at step: `[payment confirm / loyalty apply / inventory hold]`<br>• Identified root cause: `[API timeout / bad deploy / integration regression]`<br>• Shipped hotfix via `[hotfix branch / flag-off / rollback]` with QA release gate<br>• RCA document: timeline, 5-whys, action items<br>• Added metrics at each funnel step for proactive alerts |
| **R** | • Booking success restored to `[METRIC]%`<br>• MTTR reduced from `[X]` to `[Y]`<br>• Release confidence improved; playbook adopted by mobile team |

### 2-minute script template

> "On a global hotel booking app I led, during [SITUATION], our booking funnel broke at scale. I owned the mobile side of the incident. I used AppDynamics to see exactly where users dropped off — it was at [STEP]. We shipped a hotfix within [TIME] while coordinating QA gates. Post-incident I wrote the RCA and we added funnel metrics so we'd catch this before customers did. Booking success went back to [METRIC] and our MTTR for similar issues improved to [METRIC]."

### Follow-up answers (prep 30 sec each)

- **How did you prioritize hotfix vs full fix?** Hotfix restores revenue path; root fix scheduled with regression tests.
- **How did you communicate?** Status updates every [N] min to bridge; customer-facing messaging via support lead.
- **What guardrail did you add?** Funnel alerts, release gate on booking E2E tests, feature flag kill switch.

**Practiced 2 min aloud:** ⬜ Date: ______

---

## Six STAR stories — one-line hooks (Block E stretch / Day 1 list)

Use these as your story index. Expand in `PREP/D-and-E.md`.

| # | Hook | Best for |
|---|------|----------|
| 1 | Hotel booking incident + RCA + observability | Reliability, leadership, Amazon Dive Deep |
| 2 | Crash monitoring + hotfix pipeline (hotel app) | Deliver Results, operational excellence |
| 3 | ObjC→Swift VIPER migration (major retail app) | Architecture, Invent & Simplify |
| 4 | Quick/Nimble network test coverage (connected-home app) | Highest Standards, quality |
| 5 | LaunchDarkly + Adobe A/B (hotel booking app) | Bias for Action, experimentation |
| 6 | Educational App Store app 0→1 + industry award | Ownership, customer obsession |
| 7 | Release gate conflict (product vs QA) | Have Backbone, Earn Trust |
| 8 | Mentoring + architecture docs for team | Hire & Develop, leadership |

**Listed 6+ stories with bullets:** ⬜

---

## Amazon LP quick map

| LP | Story # |
|----|---------|
| Customer Obsession | 1, 6 |
| Ownership | 6, 2 |
| Invent and Simplify | 3 |
| Insist on Highest Standards | 4, 7 |
| Deliver Results | 2, 1 |
| Dive Deep | 1 |
| Bias for Action | 5 |
| Earn Trust | 7 |
