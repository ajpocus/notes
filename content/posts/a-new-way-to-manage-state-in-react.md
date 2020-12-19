---
title: "A New Way to Manage State in React"
date: 2020-12-16T17:46:26-05:00
tags: ["hacker-noon", "open-source", "react", "state-management", "hooks", "chats-with-dane"]
---

I was talking with [Dane](https://twitter.com/duilen) this afternoon, and I showed him a concept for a React hook, that would allow you to add callbacks to be notififed when state is actually, really updated. After a long discussion and lots of great ideas being thrown around, we've come up with a concept that I think will, frankly, blow your socks right off. We call it `useSharedState`.

Like `useState`, `useSharedState` returns a getter and a setter. However, that's where we start to diverge from the norm.

See, we wanted a couple of properties for this state. One, it's pseudo-global shared state, meaning that you access a namespaced global state object. This seems a bit excessive, even reckless, to some people, I'm sure. But, it's what we need! We should be able to access user data, for example, and we should be able to access it anywhere. Full stop.

Another property of this shared state is that the setter can be awaited. Let me repeat that: if you call `setSharedState` (or whatever you name your setter), you can await the result and write code that knows that state is _set_, dadgummit! We found this would be useful if say, the user is being loaded, and we want to know all of the state dispatches have been processed before we proceed.

A lot of this could be done with `useEffect` and tertiary state that tracks your dispatches, but...I don't wanna. I'm lazy. I want to set my state and **know** that it's set! It should be simple, but unfortunately, React has sort of punted this problem to let others (like the Redux team, among others) handle the problem.

Enough talk! We need code, and I'm working at breakneck speed to bring it to you. But first, I need to make sure it works, of course. So, I'm starting by converting our user state to be contained in a shared state context. It already follows most of this pattern, using `useReducer`, except we don't know when any particular state dispatch has been received and processed, so this is far superior (same goes for `setState`).

Oh, one more thing: if you just can't stand the idea of globally shared state, but you want to be able to `await` your `setState` calls...we'll be providing that, too! It'll be called `useLocalState`, and both of these hooks, if they wind up working, will be open sourced. Stay tuned!
