---
title: "Dev Journals 10: Yukon Vengeance"
date: 2021-08-30T14:16:09-04:00
draft: true
tags: ["dev-journals", "adventure-kit", "typescript", "javascript", "make-a-quest", "product-development"]
---

The inspiration for today's title comes from a movie with the same name, but it also refers to a very real problem: I'm kind of in the wilderness here.

The wilderness being Typescript, but also Redux, and most of all, the type of UI I'm trying to build.

Adventure Kit, or at least `make-a-quest` specifically, is all about visual programming at its core. This requires the design of an intuitive interface, naturally.

Problem is, I haven't really done much actual design work. Sure, I work on the frontend constantly! But I'm working from the designs of others.

Generally I started my career more on the backend, and have been working toward more of a full-stack and frontend-heavy role, as that's where I saw the work going (look at all the "serverless" models now -- still needs backend work, but the focus is definitely on the frontend).

All this is to say, I feel like I'm out of my depth sometimes when it comes to designing interfaces. The problem can be solved, still...it just requires a lot of persistence.

I'll have to go through a few bad interfaces to get to the good ones, and that's ok. Likewise, my Typescript probably won't be idiomatic or the "Right Way" to do things, but it'll improve over time.

Typescript in particular is easier to solve than the design issue. Design takes practice, full stop. But Typescript? Along with regular coding, I just need to read the docs. Or, as the greybeards say, "RTFM" (Read the "Friendly" Manual).

Anyway, if the interface works, even in brutalist form, if my code works, even if it's a bit ugly, _that's okay_.

After all, I'm learning a few things here, and all at once. And I'm writing it [in the open](https://github.com/pocuslabs/make-a-quest)! (Check the latest feature branch for my current code, literally the last code I wrote.)

Writing in the open is deserving of a post all its own. It's changing the way I code! I second-guess things that I would otherwise do without hesitation, like "should I really do \[x\] to the code?". Or I'll wonder if I should work on this or that particular feature, and so on. Plus, I get a little self-conscious about the code, to be honest.

But forget all that -- I need to work on what needs to be done! And it's not like I'm self-conscious about what I write here, so why should I worry about my code? It's a work-in-progress!

So next up:

First, I need to get quest creation going, allowing the user to build quests using common components.

These components, which I'll write about in another post, basically boil down to quest "parts", like "talk to the villager", "fetch the item", "destroy the monster", and so on.

At first, you'll just build simple quests out of these components, combining them to form parts of a story, writing dialogue and creating special items and dangerous enemies for the player to interact with.

Of course, eventually, I want to get to [more macro-level management of in-game resources, including players](/posts/the-new-style). But that's something that'll take a long, long time to develop. I need to first develop a very small part of a part of what will eventually be the macro-management interface.

At some point after the quest management interface is at a good place, I'll probably start prototyping more of the macro stuff...but that's later.

I should get back to it. 'Til then, I leave you with the Yukon Song from Calvin and Hobbes. Yukon ho!

!["The Yukon Song" from Calvin and Hobbes, by Bill Watterston](/img/yukonho.jpeg)
