# Day 1 — Swift Concurrency Notes

Source: WWDC21 *Meet async/await in Swift* + *Explore structured concurrency*

Read this, then write **5 bullets in your own words** at the bottom (Block C deliverable).

---

## Core concepts

### `async` / `await`

- `async` marks a function that can suspend (wait for work without blocking a thread).
- `await` marks a potential suspension point — only legal inside `async` context.
- Compiler enforces: you cannot forget to handle async work.

```swift
func fetchHotels() async throws -> [Hotel] {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Hotel].self, from: data)
}
```

### Structured concurrency

- Child tasks tied to parent scope — when parent is cancelled, children cancel too.
- Prefer `async let` / `TaskGroup` over unstructured `Task {}` when work is related.

```swift
async let hotels = fetchHotels()
async let profile = fetchProfile()
let (h, p) = try await (hotels, profile)
```

### `Task`

- `Task { }` — unstructured, fire-and-forget (use when work outlives caller).
- `Task { await viewModel.load() }` from button tap.
- Check `Task.isCancelled` after `await` before updating UI.

### Cancellation

- `task.cancel()` cooperatively cancels — code must check `Task.isCancelled` or use throwing cancellation.
- `Task.sleep` throws `CancellationError` when cancelled — good for debounce patterns.

### `@MainActor`

- All UI updates must run on main thread.
- Mark `ViewModel` as `@MainActor` or use `await MainActor.run { }`.
- Interview answer: "Network off main, UI on `@MainActor`."

### `actor`

- Protects mutable state from data races (your Challenge 01).
- Serializes access — only one caller at a time inside actor.
- Prefer over `NSLock` for shared mutable app state (token box, cache metadata).

---

## Interview one-liners

| Question | Answer |
|----------|--------|
| async vs completion handlers | Compiler-checked errors, linear code, automatic cancellation propagation |
| When use actor vs struct | Actor when shared mutable state across tasks; struct for value copies |
| Main thread blocking | Never block main; use await; profile with Instruments Time Profiler |
| Race in UITableView cell | Generation token / cancel task on reuse (Challenge 08 preview) |

---

## Common pitfalls

1. **Updating UI without MainActor** — subtle bugs, crashes in production.
2. **Ignoring cancellation** — stale search results after fast typing.
3. **Unstructured Task leak** — retain cycle via strong self in Task.
4. **Actor reentrancy** — `await` inside actor allows other calls between suspension points (advanced).

---

## Your 5 bullets (fill in after reading)

1. 
2. 
3. 
4. 
5. 

---

## Connect to repo

| Concept | Challenge |
|---------|-----------|
| `actor` | 01 TokenBox ✅ |
| Cancellation + debounce | 02 SearchViewModel |
| `withRetry` + cancellation | 03 Retry |
| `@MainActor` ViewModel | 02, 07 |
