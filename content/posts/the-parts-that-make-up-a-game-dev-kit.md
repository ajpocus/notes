---
title: "The Parts That Make Up a Game Dev Kit"
date: 2021-05-26T15:59:57-04:00
tags: ["adventure-kit", "foxie", "hounddog", "systems", "compilers"]
---

This new incarnation of Adventure Kit can be thought of as your own personal toybox, except these toys make old-school video games. Think in the style of the Super Nintendo, or the Game Boy Color -- that's what you'll be working with. So what sort of toys are in the box? How does the whole thing tick?

## ladybird: the core of Hounddog

`ladybird` will be the main component of the Hounddog engine that powers your game, the nucleus around which the other parts revolve. In essence, it's a parameterized, programmable game engine, using Pixi.js under the hood. There will be layers on top of the raw `ladybird` API, like...

## snappy: a nice interface to talk to the engine

With a name derived from "Sn API" (I was thinking of tin's elemental symbol -- it should "do what it says on the tin), `snappy` will be the Javascript "dialect" that the Foxie compiler will transpile into. It's really just another layer of abstraction over the raw parameterization of the engine that will power the games in the end, a "nicer" interface to work with.

## kitsune: the Foxie interpreter and compiler

`kitsune` is the powerhouse behind transpiling, or translating, from Foxie into Javascript that's compatible with the `ladybird` engine's API. It'll use `snappy` to write Javascript that talks to the engine in a standard way, leading to possiblities such as...

## bella: the "disassembler" for Foxie and its compilations

A disassembler?! You betcha! This is a nice-to-have, to be honest, and definitely won't be early on the agenda for Adventure Kit, but it would be **really** cool to have. See, with `bella`, you should be able to turn the compiled, minified result of a `kitsune` compilation, a final game, into Foxie code that you can modify! And wouldn't that just be neat?

## eris: Foxie's error handling system, for makers and gamers

This is one more of those nice-to-have features that definitely isn't going to be in v1, but it _is_ something I want to account for as I build the initial system, so it's doable later on. `eris` will provide a better exception handling system, that can detect the error being thrown, and (this is the important bit) show something to the user while notifying the developer. Again, not essential, but nice. Let's get back to the core:

## packeederm: the automagic bundler system

`packeederm` will handle the bundling of assets, along with code, into a single script + data file that can be embedded anywhere. (Super proud of the name, just saying.) This part can get complicated, because we face this fundamental issue where you want a `.js` file that can be put into a script tag, but you have assets like spritesheets that aren't exactly efficient as a base64 string. Expect more posts on this, but in short, I'm seeking to replicate Pico-8's PNG-based "cartridges".

## adventurekit: the CLI that brings it all together

So where does this leave you, the maker? Ultimately, you'll be using the `adventurekit` CLI script to generate your project. From there, there will be simple commands to run a server, build your bundle, and otherwise work on your game. It's probably how you'll end up accessing all of the tools listed above.

## Why are things broken down this way?

For one, this division of responsibilities makes it easier to start small. More importantly, it allows people to do things like:

- Customize the build process and how it compresses assets
- Develop plugins for the Foxie language to add functionality
- Write code to power the engine in Javascript instead of Foxie

It just makes the system more modular, extensible, and possibly even reusable.

## When is all this going to happen?

Obviously this is a mammoth, Herculean task, to build **all of this**...so I have to start somewhere.

The first part will have to be the `ladybird` engine. This will include an extremely low-level API, to control the parts that are programmable or parameterized.

From there, I'd ideally like to start on `kitsune` to build Foxie and `snappy` to build a friendlier Javascript API -- maybe `snappy` is a layer that isn't needed, one that can be provided by `ladybird` natively? Seems reasonable.

Finally, I'll need to get the `adventurekit` CLI up and running, so that someone can run code that hooks into `ladybird`, running the final game. At this point, `packeederm` will sort of naturally bud from the `adventurekit` CLI code...I'll have to revisit that decision to split as well, to ensure I'm doing the "Right Thing", as John Carmack would call it.

And as John Carmack would say, it'll happen "when it's ready!", no sooner, no later.

## What's with the naming scheme?

I started out naming these tools after Disney cartoon characters, but of course, they copyright everything to death, and I don't want to get sued. So, I chose new names, and some of them are kind of silly. You can't sue me for that, but feel free to complain to the nearest person, pet, or plant.

## Up next

Next up...building the `ladybird` engine core, of course! This involves writing some Pixi.js code to get something on the screen, to start, and I think one of the first things I want to nail down is the asset pipeline. Expect more posts on that, but essentially, as a maker you should be able to put textures/sprites/etc. into a directory, refer to them in scripts, and have everything "just work" down to the bundling of the app. The bundling can come later, but loading and using assets is a core game dev experience I have to get right.

So, until my thoughts well into another wave of rant-y goodness, happy making!
