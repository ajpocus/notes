---
title: "The Devil in the Details"
date: 2021-06-26T14:01:07-04:00
tags: ["adventure-kit", "rants", "thought-dump", "foxie", "ladybird"]
---

See, I get lost in details. A long-term project like Adventure Kit has millions, possibly billions, of small details to get into. The trick is taking them on in small bits.

I dive in headfirst when I see a rabbit hole -- if I'm working on something professionally, I end up coming up for air out of necessity, but on a hobbyist-level project it's all too easy to go depth-first, when I should be going breadth-first.

With a project like Adventure Kit, there are literally millions of rabbit holes calling my name, trying to draw me in and [nerd snipe me](https://xkcd.com/356/).

What I have to do is occasionally come up for air and survey the project, see what needs attention next.

Right now, the biggest hurdle is just picking up C# again. Sure, I learned it in part, at a previous job, but that was to convert the code to use Node.js instead. I just had to read it, not write it.

In my experience, it's a lot like the difference between reading and writing a human language, like French or Japanese. I took a few years of French in high school, and although I can read a passing amount equivalent to the capacity of a small child, I would only be able to write or speak a few memorized phrases. Same with Japanese: I started learning the language recently, and it's noticeably easier for me to read and sound out and take my time with text, or listen to someone speaking and understand what they're saying, as opposed to constructing a thought in the language myself.

So I do have some advantage, in that I can read existing code and, maybe with a few Google queries, I can figure out what's going on. That's great if I come across some example of "how to \[do x\] in C#" because rather than just copy-pasting, I can read, Google, and understand what it is I need to use.

So there's the language hurdle (see, I went depth-first into that problem!). What else am I facing?

I see a few challenges ahead, namely, with regards to the game engine itself:

1. Getting a window on the screen
2. Rendering some sort of pixelated sprite
3. Controlling the sprite with the keyboard

Then, with regards to the Foxie programming language, I need to:

1. Figure out which programming paradigms to adopt
2. Write the beginning of a simple parser
3. Provide an API to control some part of the aforementioned engine

The problems I face with the game engine are fairly straightforward, in my mind. They relate to learning how to do things I'm already familiar with, but in an unfamiliar language and environment (C# and .NET + Windows, respectively).

The language problems around Foxie are **way** more interesting to talk about.

I'll write another post on the problems around Foxie, but the biggest challenge there is just _thinking_. It's thinking about how the language will feel given a choice. It's about how the maker will approach the language for the first time and what that experience will be like (and it _has_ to be smooth, or I'm screwed).

So I have a dual-pronged problem here: the engine, and the language that controls it. Ladybird (or Hounddog), and Foxie, respectively. First comes the engine. At the same time, as I'm exploring C#, I can start to think about what Foxie will need to be a great language (I'll be writing out parts of that thought process on here, as it comes to me).

Until I get pixels on the screen, though, I have plenty on my plate. Time to chow down.

{{< youtube NcHrGCcXU74 >}}
