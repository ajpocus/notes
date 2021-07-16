---
title: "Dev Journals 2: The Journaling"
date: 2021-07-15T19:15:32-04:00
tags: ["dev-journals", "adventure-kit", "thought-dump", "python", "ipc"]
---

Today wasn't as good as yesterday, but I did learn a few things, especially around the myriad ways to manage processes with Python.

There's a saying in the _Yi Jing_, the _Book of Changes_, in a translation I can't seem to find at the moment:

> Too anxious, the fox gets his tail wet.
> Be like the man and not like the fox.

Today, I was like the fox. Today, I rushed ahead. To put it another way: I pulled a "Leroy Jenkins".

It started innocently enough. I was going to try and get a version of my code running, using [the design I discussed yesterday](/posts/everything-but-the-kitchen-async).

However, I learned quickly that I didn't have the tools I needed. In vain, I pushed forward:

I tried to use the `Connection` class given by the `multiprocessing.Pipe` class, but that couldn't be passed into my process.

I tried to start the process a different way, but it was still blocking the parent process.

I tried to use the `subprocess` module along with a `subprocess.PIPE` parameter...

And that got me into `Popen`, which was a low-level API that warned me I was definitely in the weeds on this.

All of a sudden it was 7PM, and I was wondering, how did I get here?

I had meant to read documentation and start slow, learning which method would be most suitable for my needs. Instead, I dove in headfirst like I usually do.

You get the idea.

Tomorrow, I think I'll start by reading a book I bought the other day: _Thinking, Fast and Slow_ by Daniel Kahneman. I've been told before that there are two systems of thinking, "1" and "2". I've been doing a lot of System 1 thinking when I should've been using System 2 here.

A more conscious approach in general would be useful. Often, even when I write English, let alone code, I rush in headfirst, go from end to end as quickly as I can.

I've written about this before: I go depth-first when I should go breadth-first, in a lot of situations.

I'll have to try this again tomorrow.
