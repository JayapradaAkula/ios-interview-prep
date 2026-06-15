# Day 1 — LeetCode Reference (study after timed attempt)

## Two Sum

**Pattern:** Hash map  
**Time:** O(n) | **Space:** O(n)

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var indexByValue: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        let complement = target - value
        if let otherIndex = indexByValue[complement] {
            return [otherIndex, index]
        }
        indexByValue[value] = index
    }
    return [] // problem guarantees one solution
}
```

**Interview talk track:**
1. Brute force O(n²) — try every pair.
2. Optimize: one pass with map — "have I seen complement?"
3. Why not sort + two pointers? Works but O(n log n) and loses original indices unless you track indices separately.

**iOS tie-in:** Same pattern as deduplicating API cache keys or pairing request/response IDs.

---

## Valid Parentheses

**Pattern:** Stack  
**Time:** O(n) | **Space:** O(n)

```swift
func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    let pairs: [Character: Character] = ["(": ")", "[": "]", "{": "}"]

    for char in s {
        if let expectedClose = pairs[char] {
            stack.append(expectedClose)
        } else if char == ")" || char == "]" || char == "}" {
            guard let top = stack.popLast(), top == char else { return false }
        }
    }
    return stack.isEmpty
}
```

**Alternative (push opens, pop on close):**

```swift
func isValidPushOpens(_ s: String) -> Bool {
    var stack: [Character] = []
    let open: Set<Character> = ["(", "[", "{"]
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]

    for char in s {
        if open.contains(char) {
            stack.append(char)
        } else {
            guard let top = stack.popLast(), top == pairs[char] else { return false }
        }
    }
    return stack.isEmpty
}
```

**Interview talk track:**
1. Only closing bracket can fail — stack of expected closes or opens.
2. Must end with empty stack — handles `"("`.
3. Related: min remove to valid, longest valid substring (harder).

**iOS tie-in:** Parser state machines, nested JSON validation, undo stacks in editors.

---

## Self-grade rubric

| Score | Meaning |
|-------|---------|
| ✅ Pass | Solved in ≤25 min, stated complexity, named edge cases |
| 🔄 Partial | Right idea, needed hint or >25 min |
| ❌ Retry | Redo blind in 3 days |
