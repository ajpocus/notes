---
title: "Long Season"
date: 2021-01-03T14:44:35-05:00
tags: ["rants", "thought-dump", "engines", "interactive-fiction", "vonnegut"]
---

As I progress in the story I'm writing, I realize more and more that I need a system that can handle things like variables, conditionals, and so forth -- a programming environment, in other words. And I'm finding all the existing systems come up short.

{{< youtube S3EKEwMXmXY >}}

What to do?

I could spend time learning a system like Twine, but I've found Twine to be inflexible, overcomplicated, and poorly documented. The last bit is really the kicker -- I can't use a system if I don't know how, and I can't know how without thorough, precise documentation.

I find myself not wanting to use a traditional text programming system at all, but rather, a visual representation.

This means I'd have to build a brand new sort of system for visually programming these stories, tailor-made for interactive fiction. That actually sounds really if appealing, if it weren't for the time it could potentially take to build a visual system of this nature.

I wonder, at this point: am I getting into a rabbit hole of complexity, a project doomed to be abandoned? Or is this something I can dedicate 3-6 months to (or less), release, and iterate on?

Being able to release early is the key thing here. That's what'll make or break the momentum of the project.

I think if I define something very clearly, with clear boundaries, ahead of time, rather than going my usual "personal project" route and just building whatever makes sense or sounds good...I might have a shot at releasing something. Otherwise, I think it's doomed to an eternity languishing in limbo on Github.

What does a visual programming system for interactive fiction look like? What are the essentials, and what can be delayed or cut?

Twine has a decent idea when it comes to visual representation of stories, but it gets messy with complex choice paths. That said, we definitely don't want to try some auto-magical sorting that makes the paths legible -- that'll take forever.

What we want is a way to cut down on visual noise and show just what the user, the author, needs to see.

I'm envisioning a system where you have a series of cards representing "scenes". You look at one card at a time, but you can see paths to and from that card, that scene, and you can click the path to travel to that point. Maybe you can zoom in and out of this...this is starting to sound like Twine, when you zoom out, but I think that part of Twine is solid enough to serve as inspiration for a v1.

Let's set aside the zooming for now. Maybe there are two levels: global view and local view. In the global view, you see all the cards at once. In the local view, you're traversing the "tree" as described above.

How do you add behavior to the cards, aside from simple traversal? In other words, how do you define variables and conditionals, but visually?

Conditionals seem like a simple visual: a flowchart-like diamond with a variable check inside, and two or more branches, would suffice. However, that's assuming the conditional is outside of a card, in the traversal stage. We might have a conditional display of content, for example, within a card -- the choices available to the viewer of the card, the reader, may differ based on, for example, whether or not they had a cigarette on the drive over, or whether their "luck" variable is over 13.

Maybe choices and content should be separate? I think so. So in that case, we need some visual representation of choices vs. content...

You know, text isn't the best medium for describing how a visual programming system works! I think I'll sketch out some ideas, on paper.
