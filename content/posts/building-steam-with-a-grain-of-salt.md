---
title: "Building Steam With a Grain of Salt"
date: 2021-05-25T14:31:55-04:00
tags: ["foxie", "hounddog", "creative-software", "gamedev", "progress"]
---

This is what it feels like, to start this [Foxie/Hounddog](/posts/the-foxie-language-and-the-hounddog-engine) project from the ground up. It feels as though I'm trying to build steam from nothing, like squeezing blood from a stone. Here, I'll just write out some of my thoughts about laying the foundation of a new game engine and its custom scripting language.

If you just came here for the DJ Shadow, though, here you go:

{{< youtube dt-EhEsdbEQ >}}

I realized something as I started to hack on the initial "layers", the foundation, of the Hounddog engine: I'm just making another game engine...what sets this apart from the horde of abandonware, vaporware, multi-million-dollar engines whose names you already know, and the open source ones you've never heard of?

I think Foxie is the magic sauce that makes it all worthwhile. See, Foxie will let you express yourself in terms of your idea, in the language of game development. It's a language **tailor-made** from day zero for making games, not some general purpose language with a game layer grafted on in the form of a library or framework. Nor is it a monstrosity of an engine with a scripting language or C++ API bolted on (no disrespect, but that ain't my style).

No, the language and the engine must coexist. They have to grow together, like siblings. More than that: like twins.

So the magic here will be in connecting the Foxie language structures, APIs, functions, etc. to the parameterized, programmable Hounddog engine.

I'm starting to think that maybe, just maybe, the language and the engine should be _somewhat_ separable. Meaning: you don't absolutely _have_ to use Foxie to leverage Hounddog.

How would this even work? By exposing the Javascript glue layer between them, naturally!

Let's back up.

All of this is going to exist on the web, for the web. We're bringing back browser games! (With mobile-friendly capabilities to boot.) So of course, this has to be written in Javascript, unless we're doing some wild WASM stuff. But not here, not now -- it's JS.

There are a few layers to the engine. The engine will be written in Javascript, and most of that will be internal bookkeeping code that no maker should _ever_ have to touch.

It'll have a pseudo-public API, though, that will power the capabilities of the Foxie language -- **that's** where we can make the separation!

If you want to just write a game in Javascript, using Hounddog, be my guest (once it's released, of course, we're still talking hypothetically here). But! If you want to leverage the full power of the engine, Foxie will have to be used.

The difference lies in how Foxie is compiled (or transpiled) into code that can execute those Javascript APIs exposed by Hounddog. When Foxie is transpiled, likely into Javascript, we can do some neat tricks in how we call the APIs, such that writing the equivalent Javascript to talk to Hounddog would be incredibly verbose (and error-prone).

At that point, Foxie becomes a lot more interesting and valuable. Then again...what if Foxie can't do something that you need?

Maybe you should be able to write plugins! APIs of your own, that supplement Foxie's superpowers!

I'll have to think more on that, but I'm already in the weeds here. Let's back up -- we need:

- A Javascript-based engine, Hounddog
- A language to control it, Foxie
- A glue layer of Javascript in between

Those are the essentials -- no sense in painting myself into a corner here ([defer decisions!](/posts/deferring-decisions)). So, until my next barrage of ideas, I leave you with something nice by that legendary duo, Prince Paul and Dan the Automator, aka Handsome Boy Modeling School:

{{< youtube -HW7nj-GUZY >}}
