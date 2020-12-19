---
title: "Watchable Computed Variables in Native Javascript"
date: 2020-12-18T18:44:03-05:00
draft: true
---

I was talking with [Dane of Colorado](https://twitter.com/duilen) today, and we got to talking about state management in Javascript, and specifically how vanilla Javascript can help frameworks get the job done with less boilerplate. Less boilerplate is always good, right?

There really isn't any sort of functionality in Javascript that's tailor-made for web apps, at least not in ES5. When we got to ES6 and beyond, it started to evolve with us, but for a long time, the best tools we had in the box were event handlers and timeouts.

Now, we have a lot of language features that are geared towards syntax improvements: arrow functions, destructuring, the spread operator, and most of the other additions we've seen do not necessarily improve the function of the language, but the form.

In the future, I'd like to see more functionality that improves on the use case of modern web apps.

Specifically, I'd like to see variables that react to their environment. Variables that vary!

Let's start with an example:

```javascript
const a = 3;
const b = 4;

const c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2))
```

This should be familiar to anyone who took geometry or trig in school. A simple calculation, where `c == 5`. Now what is there to do with this little nibble?

```javascript
const a = 3;
const b = 4;

using Math;

live c = sqrt(pow(a, 2) + pow(b, 2));
```

There are 2 examples here. I added a `using` directive, like `using namespace` in C++, that exposes all the properties on a given object as top-level variables from then on.

But that's not the main attraction.

The main attraction here is `live`. What this will do, what it should do, is it should take the expression on the right-hand side, and not evaluate it right away, but rather save the expression for later evaluation.

The expression should be parsed, and identifiers should be picked out. Any time one of these identifier references changes its value, the expression should be recomputed.

You should be able to watch changes on these variables as well. If you write:

```javascript
live c = sqrt(pow(a, 2) + pow(b, 2));

c.on(newValue => console.log(newValue));
```

It should log every time the value changes. Likewise, if you typed:

```javascript
setTimeout(() => a = 3.14, 5000); // simulate some long running process
await c;
console.log(c);
```

That should log the changed value (`await c` would return the value of the expression as well, so `console.log(await c)` would be equivalent).

The point of all this is, there's a lot we can do to make variables more eventful, more responsive, more reactive.

I'm just about spent for the day, at least as far as prose goes, but I'll be writing over the weekend. More to come!
