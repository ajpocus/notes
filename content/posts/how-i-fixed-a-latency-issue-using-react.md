---
title: "How I Fixed a Latency Issue Using React"
date: 2021-06-04T13:39:48-04:00
tags: ["howto", "javascript", "react", "protips", "wabbit"]
---

I ran into a problem with high latency in the wabbit synthesizer I'm making, leading me to ask: why is my React app so _slow_? The answers I found, coming up!

See, I'm making a React-based synthesizer called wabbit (using Next.js as well, to be specific) and I ran into what must be a somewhat common issue: my state updates were laggy. Like, really high-latency, to the point where you couldn't even pluck out a song on the keyboard by ear, because the notes were so delayed.

To give a bit more detail, I was using a single functional component that managed state using `useState` and `useEffect` hooks, along with `useCallback` to update functions when values change. (React's semantics around state access using hooks can be frustrating, sometimes.)

Whenever a key goes down, I was calling something like `setKey(key)` (where `key` is the property on the event object). I checked, of course, whether the value needed to be changed before I called this setter, since, as you might imagine, a barrage of `onKeyDown` calls and state setters would just slow the app to a crawl.

Still, I was seeing a noticeable delay between when the setter was called, and when the useEffect picked up the change, certainly more than the 100ms window you have to make an interaction feel even close to instantaneous. It felt like playing music by telephone. Or carrier pigeon.

So **what is the solution?** Well, I found an interesting approach [here on Stack Overflow](https://stackoverflow.com/questions/12273451/how-to-fix-delay-in-javascript-keydown)! Of course, you can read the answer there, but read on to see how it applies to apps like wabbit.

The problem with wabbit was that I was relying on state setters to run as quickly as possible, when really, they run on their own internal event queue in React and are processed, as far as I can tell, as soon as is _practical_. (Note: my understanding of React internals is limited, so please read the official docs before relying on my understanding regarding that point.)

This is fine and dandy for most interactive user interfaces. However, if you're expecting a near-instantaneous response, as one might expect in a game or another near-real-time app (like a synthesizer), and you try to use the standard approach using event handlers and `useState` setters and `useEffect` listeners, you're going to have a hard time getting things to seem snappy, to make the app highly responsive.

Instead, we can "break out" of React's internal event loop, and instead of relying on useEffect, we can leverage the [`requestAnimationFrame` API](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame).

So instead of checking for updates when it's convenient, we have a loop that runs about every 16ms checking for state updates procedurally, rather than a `useEffect` that is more declarative (not that those paradigms have to do with the speed difference, but it's worth noting that the latter abstracts away some control over the execution).

Bear in mind, if you're using `requestAnimationFrame`, you have roughly 10ms to do your work and queue up the next frame call -- I know, I said 16ms per frame, and that _is_ true, but counting system overhead, _your_ code gets about 10ms. These are the breaks!

{{< youtube 5ZDUEilS5M4 >}}

One other thing I did during this restructuring was to move from a functional to a class component, which allowed me to cut my state size literally in half.

Mostly, I think functional components are the future, but not every problem is a functional nail. Class-based components can still be extremely useful if you need to:

- Do something on component mount or a change that's dependent on state
- React to state changes once
- Determine whether a component _should_ update

I'm sure there are cases I'm missing, but really, I'd like to focus on the first two bullet points here. If you wanted to react to a state change, like an initialization, one time, `useEffect` requires tertiary state to manage whether or not the loop should run.

With a class component, you can just hook into `componentDidUpdate`, check the state against the previous state (if needed) and go. Unlike `useEffect`, you won't run into looping issues, or having to manage runs.

But I digress. Clearly, functional components are useful too! And I default to functional -- I was actually reluctant to use a class-based component after so long, but it was needed.

The right tool for the right job can make all the difference. Let me make clear, a class-based component is **not** necessarily faster or easier than a functional one. You can write slow code using any paradigm, trust me!

That said, this _was_ the right tool for the job, this time.

tl;dr for the skimmers:

- Know the shape of your state and which management pattern is best.
- Reduce state updates as much as possible.
- If state updates aren't picked up fast enough, try an external loop using `requestAnimationFrame`.

Like [Michael Abrash wrote in the _Graphics Programming Black Book_](http://www.jagregory.com/abrash-black-book/):

> The best optimizer is between your ears.

Happy hacking, fellow makers! 'Til next time...
