### Don't decide by yourself

- You can just make a decision on your own. For example, if there's a Go module in a monorepo which is not part of the root `go.work` file and
  you've been tasked with wiring it up, don't assume you should add it to the `use (...)` block in `go.work`. Ask with nice options that can unblock you quickly but do ask.


### Do not become the Co Committer
You will never be responsible for the changes you make, so never become a Co Committer.


### Return early
Prefer guard clauses and early returns over nested conditionals. Handle invalid, exceptional, or terminal cases first, return immediately, and keep the main path flat.

**Bad:**
```go
func Process(user *User) error {
    if user != nil {
        if user.Active {
            sendWelcomeEmail(user)
            return nil
        }

        return ErrUserInactive
    }

    return ErrUserNotFound
}
```

**Good:**
```go
func Process(user *User) error {
    if user == nil {
        return ErrUserNotFound
    }

    if !user.Active {
        return ErrUserInactive
    }

    sendWelcomeEmail(user)
    return nil
}
```


### Don't rush to commit a plan

Iterate the design in chat before writing it down. Each draft committed before alignment forces a rewrite. Settle each choice in conversation, then commit — not the other way round. Applies to plan files, `ExitPlanMode`, and any finished design doc.


### Lead investigation reports with prose, not structure

Open with plain sentences that name the discovery. Tables and decision matrices come after the framing is agreed — lead with structure and the insight gets buried. Where the user has already phrased the problem in code or chat, mirror their wording.

**Bad — structure first, finding buried:**
```md
## Hypotheses

| # | Theory               | Evidence              | Likelihood |
|---|----------------------|-----------------------|------------|
| 1 | Cold cache           | first run 4× slower   | high       |
| 2 | Network egress       | repo size grew        | medium     |
| 3 | Runner overcommit    | matrix expanded       | low        |

## Decision matrix
| Observation | Conclusion |
| ...         | ...        |
```

**Good — finding first, structure after:**
```md
The CI job's first run after a force-push is 4× slower than subsequent
runs, which points squarely at a cold Bazel cache — not the recent
dependency growth or runner contention I'd considered. Evidence and
next steps below.

## Evidence
- ...
```


### Prefer orthogonal methods over combined query-and-mutate

Reads stay pure; writes stay explicit. Bundling "check" and "clear" hides side effects in what reads like a query.

```ts
// Bad — combined query-and-mutate
class FrameState {
  consumeDirty(): boolean {
    if (!this._dirty) return false;
    this._dirty = false;
    return true;
  }
}

// caller has to read this carefully to realise the flag is cleared
if (state.consumeDirty()) {
  emit(state);
}

// Good — orthogonal
class FrameState {
  isDirty(): boolean { return this._dirty; }
  markClean(): void { this._dirty = false; }
}

// caller's intent is explicit; cleanup happens next to the side-effect
if (state.isDirty()) {
  emit(state);
  state.markClean();
}
```

The same principle applies to other paired ops: don't combine "get and remove" from a collection, "subscribe and trigger", or "read flag and reset". Name each step.


### Articulate, candid, crisp writeups

Changelogs, release notes, PR descriptions: name cause-and-effect concretely, state what's open or traded off, cut anything that doesn't change meaning. If the user has already framed the problem in code or chat, mirror their wording — don't paraphrase it longer.


### Don't be verbose in docs
When writing function docs, variable docs, or other inline documentation, do not be a blabbermouth. Keep docs short, concrete, and focused on the one thing the reader actually needs to know. Do not restate the code in longer English.

**Bad:**
```go
// UserID stores the identifier of the user that is associated with this record
// and is used in different parts of the system whenever we need to refer to
// that specific user in a consistent and reliable way.
var UserID string

// BuildRequest builds and returns the request that will be used for sending the
// payload to the upstream service after all required fields have been set.
func BuildRequest() *Request
```

**Good:**
```go
// UserID identifies the user for this record.
var UserID string

// BuildRequest creates the upstream request payload.
func BuildRequest() *Request
```
