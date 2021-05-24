---
title: "The Foxie Language and the Hounddog Engine"
date: 2021-05-24T14:26:27-04:00
tags: ["gamedev", "rants", "thought-dump", "creative-software", "foxie", "hounddog"]
---

Have you ever wanted to make your own old-school-style game? The Foxie programming language, along with the Hounddog Engine, are the culmination of over 5 years of thought and work with regards to a custom game creation toolkit. With it, **anyone** will be able to make their own game!

So, join me on a whirlwind tour, as I give a 10,000-foot overview of this ~~new~~ slightly used set of tools for making your own old-school video game, in the style of Mario, Zelda, Metroid, or whatever you can imagine.

And in case you were wondering, yes, I did name the two parts after _The Fox and the Hound_ -- I loved that movie when I was little.

## The origin story

It all started with Adventure Kit.

Well really, it all started when I was 13 years old! I wanted to make my own games, so I set out to learn to code -- that's how GamePro magazine said it was done, by a sort of "black magic".

If you'd like to skip to where I actually _talk_ about Adventure Kit and not my life story re: programming software, [click here](#adventure-kit-the-precursor). Otherwise, read on!

I had no idea what I was in for. I tried those _Teach Yourself Programming in 24 Hours_ books, and I wouldn't wish those on my worst enemy. Granted, this was before the days of prolific Javascript, or even web programming in general. Python was young. Ruby was still in Japan, as far as I'm aware, or at least in its nascent stages here in the states.

No, these books taught C++, and they caused much more confusion in a young dev than anything resembling understanding.

So what did I do? I certainly didn't learn anything in 24 hours, except maybe how much I had to learn. I googled around...I had started my programming journey, initially, by reading a book called _Masters of Doom_ by David Kushner. Then, that book led me to John Carmack's inspiration, a book called _Hackers: Heroes of the Computer Revolution_ by Steven Levy.

The book has aged a bit, and some of the characters have managed to thoroughly disgrace themselves (I'm looking at Richard Stallman and his defense of horrific acts). Still, it had an effect, when it came to the wonder these systems inspire and the desire to code them.

This _Hackers_ book led me to a document by one Eric S. Raymond, another one of those guys who, let's say, time has not been kind to, and for good reason. Anyway, the doc was called "How to Become a Hacker". It encouraged me to install Linux, which led me down an ops rabbit hole I didn't surface from for a good 5 years, until I reached community college (for a short time -- I eventually had to drop out).

I reached college with a fair-to-middling understanding of Linux, but no practical programming knowledge to speak of. In other words, I couldn't code my way out of a wet paper bag (not even if its contents were pre-sorted).

That's when a kind, knowledgable professor at Jackson Community College named [Dale Fay](https://www.linkedin.com/in/dalefay/) taught me Perl.

Perl was like a creative explosion in my brain. All of a sudden I saw infinite possibilities swirling before me, ways to automate and dynamically control all the Linux systems I had been learning about before. In other words, it was finally _practical_! I had never experienced such a rush, and to this day I'm "chasing the dragon" of creative expression.

Anyway, enough with the life story already! My point is, I experienced a sort of creative epiphany there.

Fast forward about 7 years: I've worked at multiple startups, I've freelanced, but I've never really made anything resembling a game besides a few graphical demos using Three.js. Most of my work up until this point has been on the web.

That's when Adventure Kit was born.

## Adventure Kit: the precursor

Adventure Kit was meant to be a one-stop shop for creating your own old-school role-playing game, in the style of Final Fantasy, or Chrono Trigger, or even the original Pokémon games. It would provide primitive structures that let you design your own graphics, sounds, music, maps, and scripting for the behaviors of the characters and the flow of the game.

Spoiler: it failed. But why?

Ambition is my poison, sometimes. Sometimes I take on a huge project, without realizing what it is I'm taking on until it's too late. I pick these big projects, hoping to create this wonderful experience for the end user that encompasses everything they want to do...

...then my Icarus wings melt and I plummet to the Earth.

Usually, instead of picking up again, I think to myself, "well that was clearly too lofty a goal for these wax wings" rather than "clearly, my wings were not suited for the task and I should build a more sturdy set", or "maybe I can launch from half the height".

I'm getting into the weeds here, getting too deep into the metaphor. But the point is: 1. I shouldn't give up so easily, and 2. I should adjust my goals and methods, instead of assuming the goal is some insurmountable task.

I did get as far as a pixel art engine and most of a music composition interface. This taught me a few things:

For one, I should leave graphics to the graphics tools, and the music to the music tools, and so on. Instead of "custom everything" I should simply accept common formats, and translate the data into something I can use! This seems obvious in retrospect, but you know, if you code, how those "solution blinders" can make you fail to see a solution that's easily within reach.

Another incredibly important aspect of the new approach _has_ to be to **start small**. Meaning, I should set a more reachable goal, something I can achieve in maybe a few weeks to a month. I need to keep releasing incrementally better stuff, rather than building up to "the big release" or building some monolithic monstrosity, I have to **iterate**.

## The overall plan

This brings me to the current plan. As I said, there are a few qualities I'm looking for in a game development kit:

- Accept common formats for content: music, graphics, etc.
- Let the user focus on making their game
- Following that, hide insignificant details from the user as much as possible
- Offer an interface to upload assets, which will be available to the scripts
- Build an engine that handles the details and provides an API to make the game
- Provide a language for the user to script the game

And that's just off the top of my head! But this naturally leads to questions: what is this game engine, and what sort of language will be used to script it?

## The Foxie language

[Foxie is something I've written about before](https://foxie-lang.org), but it's changed in my mind since my initial thoughts were recorded. In short, what I'm looking at here is a scripting language in the style of Lua, or Ruby, something that reads more like English, or another human language, than a "programming" language.

In fact, this isn't a programming language, or a scripting language. It's a "behavioral language", a "language of changes". These are terms that I just made up, in order to convey that this language controls the behavior of the world that the user, the maker, has created. More than that, it should allow the maker to enact changes in how the world itself is built up, how it's defined.

I still haven't really nailed down the syntax and semantics of Foxie, as you might imagine. I'll talk a bit more later about how I plan to get started, but overall, Foxie should be one thing: friendly. It should be friendly to newcomers and veteran programmers alike, and what it does should be obvious. It should follow the "Principle of Least Surprise", doing what you expect whenever possible. Above all, besides being friendly, it should be simple and powerful.

When I say "powerful", I mean it should pack a punch in a keyword. Actions should roll off the tongue as naturally as your own name, and each line should do something meaningful. I'm sick of overly verbose languages that want you to define the entire world before you get to "hello world"! (I'm looking at you, Java, though to be fair, it's gotten _slightly_ better since I used it years ago.)

Back to the matter at hand: I'll be thinking (and naturally, writing my thoughts) a lot more regarding Foxie as the language develops in my head and as I start to design some of its details.

This is obviously a big undertaking. But in essence, what we're talking about is a custom domain-specific language, a DSL, that defines the behavior of a game engine, yet to be specified. Now might be a good time!

## The Hounddog engine

Hounddog is Foxie's "other half". It's the missing piece, providing the API which will give Foxie life. It'll allow you to `PEEK` and `POKE` memory, it'll let you draw to the screen, and in short, it'll be the workhorse behind your game.

What should this API look like?

I think of interfaces like the memory-mapped I/O of the NES, and how you wrote to memory locations to control chips like the Audio Processing Unit (APU) and the Picture Processing Unit (PPU). In general, I do like memory mapping as a technique. However, the PPU in particular is incredibly convoluted in its operation, mainly due to the restrictions regarding cost and hardware and design of the system.

That's not to say the NES was poorly designed -- quite the contrary -- but it does mean it violates the Principle of Least Surprise. That's a no-go.

Rather, we want a system where you can do stuff like:

- Draw any color to any pixel
- Draw a sprite or a metasprite (a sprite made of smaller sprites) to a location on the screen
- Detect button events
- Move a sprite
- Rotate, scale, and otherwise transform a sprite's appearance
- Listen for (and trigger) events on game objects, including collision
- Scroll the screen, in any direction
- Define the map that the screen should be scrolling, from a commonly formatted map file (TMX format)
- Trigger and stop audio, with a given envelope (attack, sustain, decay, and release)

And much more! But I'm starting to see a pattern here: we want to provide an API for the most common actions in a 2D game, within certain limitations like resolution and palette, etc., and handle those actions gracefully by default.

In other words, the engine should "just know" that a player moves with the arrow keys. You shouldn't have to specify that. Likewise, collision detection should be an event by default and tiles should have a `solid` parameter that defines whether the player can cross that tile boundary.

In other words, in the spirit of Perl, it should "make easy things easy and make hard things possible".

## What's next

Again, this is a humongous, gigantic undertaking that's likely to take 10+ years, if not a lifetime or more, to get the effect, the experience, that I want.

This is easily my longest blog post so far, and my most organized to boot. So: what _is_ next? How do you even begin to build something like this?

The first goal is to make a simple "game engine". I use scare quotes because I'm not going to just go and build a whole game engine by myself in even a year, let alone a week or two. So what _am_ I building?

Version 0.0.1 of the Hounddog engine will let you `PEEK` and `POKE` virtual memory locations, with a predetermined set of addresses dedicated to the screen. If you `POKE` a value into one of these locations, hey presto! a pixel will appear.

Likewise, Foxie will be starting with those simple `PEEK` and `POKE` semantics. I'm not sure about a lot of things regarding the Foxie language or the Hounddog engine -- all caps on the instructions being one of those things -- but a lot of these things will have to be discovered as I go.

## Final thoughts

What I want to avoid is painting myself into a corner with my decisions. I need to [defer decisions](/posts/deferring-decisions) as much as is practical, feasible, and useful to the platform I'm building here.

And it is a platform! Later on, I'll talk about how these games will be distributed, native vs. web, and the possible resurgence of browser games. But in the meantime: I have code to write. 'Til next time!
