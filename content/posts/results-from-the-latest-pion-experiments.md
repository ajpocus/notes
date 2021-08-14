---
title: "Results From the Latest Pion Experiments"
date: 2020-12-13T00:21:55-05:00
tags: ["results", "interactive-fiction", "html", "css", "javascript"]
---

Turns out, it's actually super easy to make interactive fiction using plain-jane, vanilla HTML and CSS. Here's how.

First, anchor links. Anchor links determine which "room" you're in, which section of the story you currently occupy.

This has the side effect of a user being able to save their state purely by bookmarking the page, or being able to share a particular outcome by sharing a URL. I consider this a great thing.

So you have anchor links, but how do you manage their display? I mean, jumping up and down the page, the usual behavior for anchor links, isn't exactly great.

What you can do, is apply a `display: none` CSS rule on these sections that you're jumping between.

Then, on the `hashchange` event, you can add an "active" class to the current section, fading it in. When another hashchange happens, you just:

1. Look for an existing active section.
2. If it exists, remove the class and wait a couple hundred ms for the transition.
3. Add the active class to the current section

It's really as easy as that, and you can go absolutely wild from there. You can have certain links with a given class that add inventory items in JS storage for example. Then depending on that inventory, you can be presented with different options...the possibilities are really endless.

But I get ahead of myself.

The point is, you can create interactive fiction incredibly simply using basic HTML and CSS techniques, and a bit of JS. The whole thing should weigh under a megabyte, unlike most sites out there these days...it's actually pretty impressive, if you think about it, that hypertext handles this use case so well, so naturally.

Anyway, signing off for now, this is ajpocus, wondering why I picked that handle despite the fact that literally no one, on the planet of Earth, calls me "AJ". And hopefully they never will.
