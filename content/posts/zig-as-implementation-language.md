---
title: "Zig as Implementation Language"
date: 2022-03-21T18:09:11-04:00
tags: ["ziglang", "gamedev", "adventure-kit", "language-design", "nes"]
---

After a good sabbatical, I'm back and writing. Lately, I've been interesting in the [Zig programming language][1], and how it might relate to [NES development and 6502 assembly][2].

Zig, for the uninitiated, is a small and fast C replacement and glue language. At least, that's how I've been thinking about it. It's like Rust with the restrictions (and memory safety) removed, a tradeoff I favor, since I'm developing games and I want to hack out a concept, not necessarily a production system.

Let's back up. I've been wanting to get back into NES development, making games for the original Nintendo system. It's a sparse environment, to say the least, but I think it can be made better in 2 respects: tooling, and language of implementation.

Let's talk tooling first, since it's the shorter of the two topics, something I've only briefly considered. Graphics and audio tools are plentiful for the NES, but finding something that works well, is updated regularly, integrates with the code you're writing...it's almost enough to make me want to develop modern tools for these old systems.

Almost. Not quite, though. Existing tools work, but the biggest hurdle I'm facing right now is writing 6502 assembly code. Thankfully there are resources, like [Rodnay Zaks's _Programming the 6502_, freely available on archive.org][3] (legally, too!). I've been going through the [Nerdy Nights tutorials as well][4], which are indispensable for actually getting something on the screen.

6502 is great as far as assembly languages go -- much better than modern x86, which is designed to be written by compilers. Even so, it can get tedious, and with the memory and computing limits of the NES, it's not so easy to just use C. There are a lot of things you just can't do, common constructs you can't use.

That's where Zig could come in handy. One of Zig's greatest strengths is that the standard library is optional -- huge for embedded use cases, or limited-resource environments like this. There isn't a 6502 backend as of this writing, but there is [a GitHub issue that requests this feature][5].

So that's one option. Of course, a language tailor-made for 6502 NES development would be ideal. Maybe I can build a set of macros on top of 6502, like a custom assembler...

That's really what I'm moving towards -- not using Zig directly, but rather, as the implementation language for another custom language, geared towards the NES.

First, though, I should probably write a game actually using 6502 directly. I want to be able to make games for the NES more easily, but I need to take the hard route first. Learn my way around.

Maybe I'll make a thin abstraction layer along the way. Who knows...either way, I should take a more minimal approach.

I might pursue this, I might not, but either way it's fun to think about.

[1]: https://ziglang.org/
[2]: https://www.nesdev.org/wiki/Nesdev_Wiki
[3]: https://archive.org/details/Programming_the_6502_OCR
[4]: https://nerdy-nights.nes.science/
[5]: https://github.com/ziglang/zig/issues/6502
