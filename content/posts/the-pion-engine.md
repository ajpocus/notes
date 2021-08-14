---
title: "The Pion Engine"
date: 2020-12-11T17:26:00-05:00
tags: ["interactive-fiction", "engines", "javascript", "language-design", "philosophy"]
---

## Intro

Current interactive fiction (IF) engines that target the web as a platform are incredibly heavy handed in their approach to writing IF. Rather, I need an engine that gets out of my way and lets me _write_.

## Problems with current approaches

The current engines:

- Use complex custom languages that I have to learn, almost like learning a new programming language in itself.
- Have heavy export processes for the most part.
- Are not very flexible, and when they are, it’s hard to customize behavior.

What I really want is something tailor-made for the stories I have in mind. What I really want is an engine that’s built from the ground up for what I need. And I want that to evolve with me and my stories.

## Potential problems with potential solutions

I can see it now, all the potential “issues” I could run into while building this:

- Abstracting too early
- Building stuff I don’t need or use
- Building to solve “future problems” not “now problems”

If I’m really going to go down this path, I need to avoid these issues like the plague. I put it in scare quotes above because they’re not intractable, unavoidable problems, they’re just problems in how I approach the problem.

## What I need

This is what I really need to write stories:

- A markup language that can handle linking between pages without changing the url the user sees.

Actually, that’s it! From there, I could add:

- Inventory management
- Parsing pre-defined commands
- Parsing free form text

And all sorts of other solutions I don’t need, right this minute, **here and now**. All I need right now is a way to tell a “choose your own adventure” story. That doesn’t necessarily include all the extra stuff I described above. I can just provide choices to the reader, in the form of links between pages...keep it simple.

## The iceberg ahead

What I’m looking at here is simple on the face of it, but it’s complex under the surface, namely when it comes to the engine. How the engine handles markdown parsing and insertion of HTML can make or break the viability of this engine as a short term project.

## Takeaways

- Keep it simple, stupid!
- Start small and release often
- Serve the real use case at hand, not imaginary ones

The last point is the key one, I think. The first two follow from the third: keep the engine serving use cases I’m seeing, solving problems that I’m actually facing.
