---
title: "Native vs Web"
date: 2021-06-24T11:15:38-04:00
draft: true
tags: ["adventure-kit", "ladybird", "rants", "thought-dump", "windows", "gamedev"]
---

The native app vs. web debate seemed to be rather settled -- the web is the future, right? Not so fast, friend -- the line gets blurry sometimes.

Naturally, we admit that apps that require native functionality, or are speed-sensitive (such as games) need to be native, obviously (I'm talking about desktop native here, not mobile native, just to be clear). But what if we're making tools to make games?

The more I think about it, the more it becomes clear that these games that I'm helping to create, need to run on Windows, first and foremost. It's the de facto standard platform for games!

Don't get me wrong, I'd love to have these games running on the web as well -- let's have a Flash-style game revival! But that's not the primary goal.

The primary goal is: help gamers make games without prior programming experience. This implies that the game will run on their preferred platform, and that happens to be Windows, with Mac a distant second. Web gaming is a fun distraction at best -- no one ships serious games for the web anymore, as far as I've seen, especially when it comes to triple-A titles.

Of course, we're not making triple-A titles, in terms of graphics and audio production -- these Adventure Kit games will be a bit more like some of the old-school roguelike tribute games you see on Steam.

That's another goal: be distributable on Steam. Every gamer knows Steam, every game dev wants to be _on_ Steam. It's another one of those de facto standard platforms that everyone just knows and uses.

So in short, I'm making the switch from the web to a Windows native application.

What does this mean?

For one, it means I'm probably not using Javascript! I'll have to use Rust or C++, probably C++, or possibly C#. The latter could be a great option, a nice "bridge" between the world of web development and the relatively unknown realm of desktop development.

Then again, that garbage collector, that makes C# so appealing over C++, could also bite me later on...then again, it's not like I'm making some wild machine here that's going to eat up copious amounts of CPU and RAM.

It's an _old-school_ engine. It's _limited_ by its nature. So, it's not like I'm going to hit that wall where the GC "pauses the world". Even if it does for a few hundred milliseconds, is it really going to cause some intense stutter that's going to take the player out of the experience?

Unlikely. We're not talking about some graphically intensive simulation either -- again, this is **old-school**. Think Super Nintendo or Game Boy Color.

I think I've talked myself into it: I can start with C#. If it becomes an issue, I can always make the switch to C++ as long as the decision is made reasonably early on.

What else does this desktop decision imply?

Asset bundling suddenly becomes a non-issue. I can bundle whatever assets I damn well please into an .exe file, as far as I'm aware, so I can punt the problem of bundling to the OS -- this is a nice feature.

I still face the question of how much of the asset creation I should be handling. In fact, that's the biggest question I'm asking myself right now.

On the one hand, a lot of tools are following this pattern in providing an all-in-one dev kit, whether it's [Pico-8](https://www.lexaloffle.com/pico-8.php), or [TIC-80](https://tic80.com/), or [LIKO-12](https://liko-12.github.io/#/), or another clone of the original Pico-8 concept.

They have graphics tools, they define very strictly the music composition limits...and for the most part, all assets have to be created on the system.

But is this how games were developed in the past? For the most part, the answer is no!

In past systems like the Nintendo Entertainment System (NES), you had a memory-mapped register or 12 that you could read from and write to, and that controlled the sound chip or audio processing unit (the APU), the picture processing unit (or PPU), and input from controllers, etc.

In other words, the _only_ thing that the NES would accept, in terms of assets, was code, and it let you embed binary data that could be translated into pictures and sounds. (Really, the code was data, and data can be code, but that's another story for a [Lisp](https://racket-lang.org/)-ier day.)

This is sort of a revolutionary concept, compared to how games are made today...what if the asset pipeline was, instead, a sort of hybrid system?

Let's say you create a PNG spritesheet in \[insert favorite graphics tool here\]. Obviously, the best thing, the "Right Thing", is to let the maker import the spritesheet.

When we import an asset, whether it's graphics or sound, we can impose restrictions: we can limit the format, limit the resolution of sprites, limit the bitrate of the music being played, and so on.

So what you end up with is an approach that, as far as I'm aware, hasn't been done before in game development. Every other engine, every other system or platform, has either made you create assets in-app (ala Pico-8), or allowed you to import assets wholesale and in their original form (like Unity, Unreal, and what have you).

Next, I'll have to think about how assets are going to be limited, what sort of limits I'm going to impose...my initial thought is 8x8 base sprites, with 24-bit color on a PNG for graphics, and MIDI files for sound that will use prebuilt instruments when fed into the engine.

Simple is better here. I mean, it's already going to take 10+ years to make this thing in its true form, more likely a lifetime! Why make more work for myself, right?

I've about run out of useful things to say, so until next time, enjoy a cover of Pink Floyd's "Have a Cigar", by none other than Primus:

{{< youtube HD1L_LOxme0 >}}
