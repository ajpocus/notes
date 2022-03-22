---
title: "A NES-like Virtual Machine"
date: 2022-03-22T16:05:09-04:00
tags: ["nes", "virtual-machines", "adventure-kit", "gamedev", "lua"]
---

Yesterday, I was thinking about [a layer of Zig between me and the NES][1]. Naturally, this led me to wonder: what if I made a virtual machine that is NES-like, but easier to program?

But first, a soundtrack, because I have this song stuck in my head and you should too:

{{< youtube n1TNLU-ydLA >}}

I've thought about a custom virtual machine [a few][2] [times before][3], but not so much in those terms. I think of this apart from those early efforts -- this is more of a fun thought experiment, not necessarily something I'll dive into further.

So what would this virtual machine look like?

The first thing I'm thinking of is the behavior the VM exhibits, followed by the interface it defines to allow us to change that behavior (this might seem obvious, but bear with me -- I'm thinking out loud here).

The VM should let us:

- Define shapes, individual pixels, and tiles on the screen.
- Animate those graphics, using tiles or pixel transformations.
- Detect collisions between objects on the screen and react to them.
- Move pixels, groups of pixels, shapes, or tiles in any direction.
- React to user input, from the keyboard, mouse, or a controller.
- Define "action buttons" that trigger interactions with onscreen objects.
- Simulate user input like movement or interaction, to create NPCs and enemies.

That seems like a solid base. The first thing to build would be the graphics -- that's the core, naturally. So how we define the shapes, pixels, and tiles will influence how the whole system works (a perfect opportunity to [defer decisions][4]).

From here, how do we interact with this behavior? Do we use a language like Javascript, or Zig, or Lisp, or do we define something new?

Side note: for a long time, since I discovered Lisp-like languages, I wanted to create a custom language that uses something similar to [M-expressions][5] instead of S-expressions. Think: fewer parentheses. In other words, a sprinkling of syntax to make Lisp constructs easier to deal with, without sacrificing much in terms of parsing (and macro expressions!).

But this is a tangent, a technical desire as opposed to a user need (and I'm a user in this case, so it's doubly important to think about).

What would the ideal language look like?

It might be Lua. [Lua has been used to great effect][6] in the video game industry, so it's a pretty safe bet. Maybe I start with Lua and expand from there? Hypothetically of course -- I'm not actually going to start building any of this yet.

What if we followed the tangent? What would an ideal language look like?

I do like the idea of using some form of M-expression, such that we could:

1. Remove the outer layer of parentheses so `(+ 1 2)` could be `+ 1 2`.
2. Add a little syntactic sugar, like for dictionaries, as in Clojure.

This is getting way into the weeds, but you get the idea. VMs are just fun to think about -- we can create little worlds. And that's the entire appeal of making games, so it seems appropriate. Signing off -- tune in next time, same bat-channel.

[1]: /posts/zig-as-implementation-langauge
[2]: /posts/the-foxie-language-and-the-hounddog-engine
[3]: /posts/the-parts-that-make-up-a-game-dev-kit/
[4]: /posts/deferring-decisions
[5]: https://en.wikipedia.org/wiki/M-expression
[6]: /posts/i-wanna-know-what-love-is