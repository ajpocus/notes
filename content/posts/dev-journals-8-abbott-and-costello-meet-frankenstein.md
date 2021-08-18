---
title: "Dev Journals 8: Abbott and Costello Meet Frankenstein"
date: 2021-08-18T15:34:50-04:00
tags: ["dev-journals", "adventure-kit", "javascript", "state-of-the-funyun", "state-management"]
---

First and foremost, yes that's a real movie title, though I've never seen it. Today, I'll talk about the Frankenstein's monster that is state management in React.

It all started because I wanted to prototype faster.

See, I had been using Python with the expectation, or assumption, that Windows dev was the way to go. After all, that's where the vast majority of games are these days (except consoles, but console dev is a different beast entirely).

Of course, there are other benefits of moving to the web, which I outlined in [my last journal](/posts/dev-journals-7-revelation). What I neglected to realize, is that by going back to the web, to supposedly familiar tools, I would naturally run into problems I hadn't solved yet, and more importantly: tools and solutions I hadn't used yet.

The goal was to minimize my learning curve during development, in other words. And I had a few false starts, the first day!

The obvious answer, if I was using the web, was to use Next.js and React. This solution fell to complexity quickly, as I was trying to embed a Pixi.js frame inside the app, something that doesn't exactly come naturally to a framework like React.

There may have been a better way, with Vue.

I had used Vue in the past, but never in earnest, never for an entire app. So when I started, it seemed easy, but I quickly found myself googling simple concepts in rapid succession, and I realized, hey, I don't _know_ Vue. Not well enough to hack something out quickly, at least.

So I went back to Next.js, under the assumption that I'd punt the problem of integrating Pixi.js. I know it can be done -- I've done it before, with raw `<canvas>` elements too -- I just don't want to deal with it right this second.

Besides, the quest definition interface is more important anyway, for this proof-of-concept.

Back in React-land, the first challenge arose when I faced management of complex state. This always seems to be a sticking point, in React apps, and although I've approached it in the past with the Context API and `useReducer`, in this case the problem needed a better answer than the cumbersome API I had relied on previously.

I'd have to write another post entirely, to fully describe the combination of `useReducer` and React's Context API to manage a complex state object across components, but let's just say it presents a whole new set of challenges, with a weird, easily misused API. Not to mention, you miss out on some of the benefits of just using straight-up `useState`.

This led me back to a common answer for React state management, one I hadn't explored in a considerable span of time: Redux.

Redux was a pattern I had used before, in the first Adventure Kit incarnation even. Back then, I was using alt.js to create the store, define the reducers, etc. but it's all the same family, it's the same pattern.

This is where I am now, just integrating Redux so that I can do things like update a step in a quest, or delete a step from an array of steps, or define a new story, without having to use that godawful `useReducer` pattern.

I mean no disrespect to the hard work of the React team -- `useReducer` can be a great tool for the right job. In this case, it was emphatically _not_ the right job, and it's my fault for misusing it. Again, I'll have to write a separate post on the pattern, maybe after I post this.

Anyway, that's the current "[State of the Funyun](https://www.perl.com/tags/state-of-the-onion/)". Learning to use Redux again, and more importantly, figuring out what I need and what I don't need for this prototype, is the order of the day.

Tune in next time for Redux learnings, bad state management patterns you shouldn't use, off-the-wall ramblings, and general technical nonsense -- same bat-time, same bat-channel!
