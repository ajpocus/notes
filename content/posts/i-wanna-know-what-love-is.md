---
title: "I Wanna Know What LÖVE Is"
date: 2021-12-13T23:51:20-05:00
tags: ["gamedev", "adventure-kit", "dev-journals", "lua", "love2d"]
---

In this post, I want to tell you about the LÖVE framework, and how I fell in actual love with a language called Lua.

Fair warning: this post is heavy with puns on song titles, rambling technical esoterica, and a slight dose of lunacy.

## What is LÖVE?

For the uninitiated, LÖVE (or [love2d](https://love2d.org) as I'll call it from here) is an excellent little Lua framework for making games. It's not an engine so much as a set of building blocks.

This has led me down an interesting path regarding [Adventure Kit](/tags/adventure-kit). Really, it could be built entirely on top of love2d, a set of modules that click together nicely and help you build an RPG using love2d under the hood.

I could even potentially wrap or monkey patch the love2d APIs, to make them nicer to work with -- Lua, the lingua franca of the love2d world, is a very monkey-patchable language.

## Whole Lotta LÖVE

I'd like to take a brief moment to talk about how awesome Lua is. It's this incredible little language, interpreted by the default implementation but also available in a compiled variety called [LuaJIT](https://luajit.org/luajit.html). It's _fast_ and _small_ -- the whole LuaJIT VM weighs in at a featherweight **115KB**. Stick that in your CPU pipeline and smoke it!

Its influences can be felt, if you've worked with a variety of languages. You can see the prototype-based OOP that's reminiscent of Javascript, for one (though Lua is a bit older, probably taking a cue from the Self language).

It has some functional components, too! Functions are first-class objects, like most modern languages. Unlike some modern languages, though, it considers `goto` not necessarily harmful, but _useful_. (The book even gives a working example of a state machine using `goto`!)

The coolest thing about Lua is its incredible strength and speed for its size. It's completely disproportionate...it's like the Ant Man of programming languages. It's highly reminiscent of C (which makes sense because that was part of Lua's origins -- C is the language it was implemented in and whose APIs it borrowed).

The Lua APIs are so simple, the language so intuitive, that I was able to pick it up _without reading a guide or book first_. The language is _that good_.

Instead of the laborious process I took when I most recently learned say, Rust, or C++, Lua was immediately apparent. It's clear what the code means, I simply read the example code, mimicked it, googled things as they came up, and I was away and writing code at a good clip within a couple of days.

(Don't worry, I started reading the [official book](https://www.lua.org/pil/contents.html) in earnest after I spent a week or two writing Python-esque Lua.)

It's a testament to the quality of the language, the readability and simplicity of most of what you'd do in Lua. It speaks volumes that such a language can be picked up easily.

I mean, you could pick up a simple but less powerful language quickly too (e.g. Markdown, yes it's a language) but what makes this amazing is that Lua is incredibly powerful for all this simplicity in its construction.

But I digress.

## The Power of LÖVE

The structure and cadence and flow of Lua weighs heavily in the implementation of love2d. You can see it in the module structure of the library, the APIs, the ecosystem, and how all of these feel when you're using them.

(I realize I'm using some intuitive, touchy-feely terms here to describe very deterministic and non-magical systems. But I feel expressive, and sometimes these things _are_ based in intuition. How it feels to use a system makes a difference.)

The most striking thing about love2d is the sheer number of libraries that build on top of it. It's something I've seen when using tools like jQuery, React, etc. in Javascript, but not quite to this degree.

To get an idea of what I'm talking about, check [the awesome-love2d repo on Github](https://github.com/love2d-community/awesome-love2d). There, you'll see people have built libraries to deal with physics, audio, graphical effects, state management, GUIs...I can't even list all of the things the community has built on top of it!

But I've been working on Adventure Kit, right? You may be wondering:

## What's LÖVE got to do with it?

_(Got to do with it?)_ Ahem.

It was suggested to me that, in order to build Adventure Kit, I should first build an actual game that resembles the style I'm trying to target.

As it turns out, this is an _excellent_ method for designing a tool. Who knew.

I'm already coming up with module ideas, as I progress. I have sprite loading, basic movement, physics, tile map loading using the [Tiled](https://www.mapeditor.org/) map format, and a few other odds and ends, like a "run" button I implemented during some testing frustration -- "necessity is the mother of invention"?

But my proudest creation so far is a spritesheet loader that takes margins and padding between sprites into account. This is necessary due to the nature of OpenGL textures, as I understand it -- they "bleed", such that the sprite next to your supposed boundaries will "leak" onto the screen by 1 pixel or so. The solution was to add transparent pixels as padding, so that the first sprite will be rendered in the correct position, the next tile will overlay the padding pixels, and so on.

## All You Need is LÖVE

From here, I'll be continuing development on the game, which I've tentatively named "Escape from Valis" (inspired by the Philip K. Dick book of the same name). The gameplay I've planned so far involves plenty of 2D pixelated Fallout-style dystopian action, set in a fictionalized mega-city.

I haven't gotten to the RPG-related parts of the development cycle, but the nice thing about game dev and the love2d framework in particular is: you kind of have to iterate quickly and keep the game playable, lest you fall into a pit of unrunnable code riddled with errors.

It's getting late, or early, depending on your perception of time. Tune in next time, same bat-channel!

![Batman doing the "batusi"](/img/batusi.gif)
