---
title: "Open Source vs Closed Source"
date: 2020-12-21T21:17:55-05:00
tags: ["hacker-noon", "open-source", "better-state", "notes", "tools", "react", "javascript"]
---

Don't get me wrong -- this isn't a competition or side-by-side comparison of the merits of open source vs. closed source. That seems to be fairly obvious, being that a lot of people have written about it at length already. Rather, I'd like to talk about my personal experience getting to a first release on my first real open source project, and how that differs from closed source.

As I write this, I'm working on a set of React hooks for managing complex state. This will include:

- `useUpdateState`: lets you update a deeply nested object ala lodash's `set` helper.
- `useListenerState`: provides an interface for setting (and unsetting) event / change listeners on React state, using `useUpdateState` as a base.
- `useAwaitState`: with this, you simply `await` the result of a `setState` call. Easy as that!
- `useBetterState`: a combo of `useListenerState` and `useAwaitState`, giving you the option to get the best of both.
- `useSharedState`: use these enhanced state objects, made for deeply nested state, across your components using React's context API.

As you might imagine, this is pretty involved! And I find that I'm writing code differently than I would if I were writing closed source, proprietary code for a company, as part of a job (this is a work project, but you know what I mean).

I find myself, first and foremost, thinking about Developer Experience, or DX. This can, I think, be blown out of proportion -- UX is much more important than DX, most of the time -- but in this case DX _is_ the experience. The whole thing, that's it, it's all developers.

So I find myself thinking about how the user, the developer using this library, will be affected by my decisions. I'm writing comments and clarifying code like my life depends on it. If you approach `better-state` with zero knowledge, you should be able to pick up the fundamentals of what a hook does and how it behaves within 5, 10 minutes tops. At least, that's the goal.

I'm thinking about how I would want to experience this library. I'm treating others how I want to be treated, when developing this library.

I find that I'm not making any "surprising" decisions, either. I'm trying to make as many results of the API as dull as I possibly can, as in: if you do something mundane and expect "x" as the result, I should give you "x" as the result, regardless of whether it makes more work for me. In the worst case, I should do nothing rather than do something surprising -- suprises in unfamiliar code are rarely fun.

I'm also writing a lot of documentation, whether through this blog, our Slack, or in the repo's README. I'm meticulously recording how things work, first in comments, then in the README.

In general, it's an entirely different ballgame, writing code that's meant to be read and used by other people. I remember, I tried it, twice before.

The first time, I tried making an SDK, for integrating mobile apps with an API I was working on for a little startup that doesn't exist anymore. That was a massive failure, mainly because I didn't think about what it would be like to use the thing. That last sentence can describe at least half of startup failures, come to think of it.

The second time, I made a couple of libraries for myself and put them on npm, but they were so halfheartedly half-assed, that my remaining quarter-effort was hardly compelling to anyone. I didn't really sell it in the README, didn't care about usability, still, so it languished and eventually the code "rotted".

My point is: open source is obviously more than just code and utility and DX, but those things _do_ matter. And that makes the experience of developing such software quite different. Rather than hacking through to the end, you _have_ to cover edge cases. You surely _must_ have tests! And you have to have documentation for other devs to use the thing, something that so many developers are lacking, myself included. I mean, I can write, but am I that good?

You tell me.
