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
