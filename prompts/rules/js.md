# Development

## Local Setup

### Prerequisites

- Node.js >= 24.0.0
- pnpm >= 10.x

# Development Rules

### Use proper types
Always use explicit types. Do not use `any` or `unknown` unless genuinely required. If `unknown` is needed, narrow the type with a type guard before use.

```ts
// Bad
function process(data: any) {
  return data.name;
}

// Good
interface User {
  name: string;
  age: number;
}

function process(data: User): string {
  return data.name;
}
```

If you're working in a plain `.js` file, make the contract explicit with JSDoc. Untyped JavaScript quickly turns into implicit `any`, so use `@typedef`, `@param`, and `@returns` rather than leaving the shape undocumented.

```js
// Bad
function process(data) {
  return data.name;
}

// Good
/**
 * @typedef {object} User
 * @property {string} name
 * @property {number} age
 */

/**
 * @param {User} data
 * @returns {string}
 */
function process(data) {
  return data.name;
}
```


### No implicit any
Every function parameter, return value, callback argument, and object shape should be known to the type system. Do not suppress type errors with `@ts-ignore` or `as any`; fix the type at the boundary instead.

```ts
// Bad
function renderUser(user) {
  return user.name;
}

// Bad
// @ts-ignore
const label = response.label;

// Good
interface User {
  name: string;
}

function renderUser(user: User): string {
  return user.name;
}
```

### Always use braces for control structures
Never write single-line `if`, `for`, `while`, or other control structures. Always use braces on a new line.

```ts
// Bad
if (this.completed) console.log('completed');

// Bad
for (const item of items) processItem(item);

// Good
if (this.completed) {
  console.log('completed');
}

// Good
for (const item of items) {
  processItem(item);
}
```

### Test assertions: assert on event content, not just count or existence

For event-stream tests, a regression guard should be specific about what each event looks like. Vague "exists" or "length >= 1" checks pass even when the shape is wrong; explicit per-field assertions fail fast and tell you exactly what diverged. Import enum-like constants from their source rather than hard-coding string values — the test then fails cleanly if a constant is renamed upstream.

```ts
// Bad — count + existence only; broken shape would pass
assert.ok(events.length >= 1);
assert.ok(events.find((e) => e.type === 'order_paid'));

// Good — explicit fields, named constants, helpful failure messages
const paid = events.find(
  (e) => e.type === EventType.OrderPaid && e.orderId === 'ord-42',
);
assert.ok(
  paid,
  `expected OrderPaid event for ord-42; got: ${JSON.stringify(events)}`,
);
assert.equal(paid.currency, Currency.USD);
assert.equal(typeof paid.amount, 'number');
assert.ok(paid.amount > 0, `amount must be positive; got: ${JSON.stringify(paid)}`);
assert.equal(paid.metadata?.gateway, 'stripe');
```

Consolidate related per-field checks inside a single `it()` rather than splitting into many tiny tests that share the same setup. One comprehensive test is easier to read and faster to run than five tests that each rebuild the same world.


### Refrain from using complex ternary operators
Use ternaries only for simple value selection. Once the expression becomes nested, mixes multiple concerns, or takes real effort to scan, rewrite it as `if` / `else` so the control flow is obvious.

```ts
// Bad
function getBannerLabel(
  isLoading: boolean,
  errorMessage?: string,
  isSaved?: boolean,
): string {
  return isLoading
    ? 'Loading...'
    : errorMessage
      ? `Error: ${errorMessage}`
      : isSaved
        ? 'Saved'
        : 'Idle';
}

// Good
function getBannerLabel(
  isLoading: boolean,
  errorMessage?: string,
  isSaved?: boolean,
): string {
  if (isLoading) {
    return 'Loading...';
  }

  if (errorMessage) {
    return `Error: ${errorMessage}`;
  }

  if (isSaved) {
    return 'Saved';
  }

  return 'Idle';
}
```
