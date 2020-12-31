---
title: "Next.js vs Raw React, or, Scobra vs Cupcake"
date: 2020-12-30T22:10:42-05:00
tags: ["react", "nextjs", "metal", "tools", "programming", "engines", "vonnegut"]
---

That was a great song back in the day, by Arsonists Get all the Girls.

{{< youtube 7aNn4vZFnU4 >}}

Or maybe it wasn't a great song, maybe we were all deluded.

That gets me to my main topic (sort of): Next.js vs React. See, React has provided this sort of "base", and Next.js has essentially built the new Rails or Express.js on top of that. Which is pretty goddamn cool.

Except when it's not.

See, I need nested routing. For example, if you view `/posts`, it should show a list of posts to the left. If you view `/posts/123`, it should display the posts to the left _plus_ the post you selected.

Does that make sense?

Now, I need that to N levels. To the nth degree, as they say. I need nested routes on nested routes, like `/acts/1/parts/3/details` and I need the layouts for all those parts to "just work". This should act like Rails, sort of, at least in the layout logic.

Except in Next.js, that's not how it happens.

In Next.js, routing is declared more like in Express.js -- you declare routes, and they have an output. What that output is, is up to you. There is no notion of nested layouts, like there might be in Rails, for example.

In React, raw React out of the box with no plugins whatsoever, routing is...complicated. But most people use `react-router`. and with React Router, you can define the sort of layout I'm envisioning, where each part builds on the last, where layouts are nested.

Of course, every app has its different needs.

See, the world don't move to the beat of just one drum. What may be right for you, may not be right for some.

It takes diff'rent strokes to move the world!

{{< youtube 6jJIVK-daGk >}}
