---
title: "The Long Strange Trip"
date: 2021-05-03T14:46:22-04:00
tags: ["rants", "nintendo", "nes", "retro", "gamedev"]
---

It's been a while since my last post, since due to health reasons, I was a bit incapacitated. During that time, I studied, made a resolution to focus on finishing one thing and one thing only, and since I have the equipment, skills, and interest: it's the Nintendo Entertainment System, or NES.

It was the first game console I ever owned -- my cousin showed me where to find all 3 warp whistles in Super Mario 3...it was like my virtual playground. I spent countless hours exploring the different worlds, my favorite being the giant world, World 4 (this is entirely from memory, I know each world by heart).

The point of all this is to say, I loved the NES. And when I started playing games as I got older, on the Game Boy, the N64, the GameCube, I started to become curious about how these games were made. It's what led me to become a developer! At least, at first.

I had tried game development since then, quite a few times. I actually started by trying to learn game dev with C++, using those "Teach Yourself in X Hours" books. It was an horrific experience for a programming first-timer, one that put me off of programming for a good 3-4 years (I was 13).

I've made demos, using three.js. I've made HTML-based games. But this supposed chimera that's eluded me since the beginning is, naturally, the NES.

So, I've come full-circle at this point. I've written about previous attempts, but this time, I really buckled down. I have a good grasp on the basics of 6502 assembly language and its core behavior, I can initialize the NES's system and make a beep...but graphics continue to baffle me.

Let me explain. This will provide context, but mostly, it's to help me think through the confusion I'm facing.

The NES has a few chips, a few subsystems, but in this case, we're concerned with the Picture Processing Unit, or PPU as it's commonly known. The PPU has its own memory, but we interact with it through memory mapped registers in the 6502 address space. I won't go over the specific registers here, since that's better covered by [the NESDev Wiki page on the topic](http://wiki.nesdev.com/w/index.php/PPU_programmer_reference).

There's a pretty clever system for getting memory into the PPU's address space, where it can be displayed. This system is known as OAM DMA, or "Object Attribute Memory DMA". I can't find a reference for what DMA stands for, but I think it might be "Dynamic Memory Access" -- you'll see why in a moment.

OAM DMA is clever because you just provide a pointer to where your data starts. Instead of doing a bunch of LDA/STA instructions (load into A, and store A, respectively), you just give it the upper byte of the starting address (the latter part of $ABCD, or "CD", in hex).

**Warning**: I think this is where things start to get fuzzy. NES details from this point on may be inaccurate or flat out wrong. I've linked to the NESDev Wiki pages to mitigate this, which are a much more reliable source of technical information if you can grok all the details.

Anyway, once you load that pointer into the memory mapped register, write to another and it'll use that byte as an offset in the PPU's memory, loading 256 bytes of data into the PPU.

Now, this is neat and all, but it's assuming you already have graphics in the right format, in the right place. I know how to load a CHR file, but I have zero clue how to create one. This is where my learning begins, right now.

See, the graphics are defined in certain bit patterns, as I've learned over the past few days. There are a few layers to this (no pun intended): there's the nametables, then the pattern table, and finally, the attribute tables.

The [nametables](http://wiki.nesdev.com/w/index.php/PPU_nametables) are fairly straightforward, in my mind. They simply define which tiles in the tileset will be in each place in the background. There are 4 tables, but there's also a concept of "mirroring". In vertical mirroring, it's a bit unintuitive but imagine a 4x4 grid on a sheet of paper, and folding that along the x-axis. That's vertical mirroring -- it allows for side scrollers. If you're making a game like Kid Icarus, use horizontal mirroring. Some games, like Gauntlet, use all 4 tables independently without any mirroring, but this is apparently pretty rare.

Anyhow, the nametable is where your background lives. As far as I'm aware, what you would do with this nametable is write references to the pattern table, coming up next. These writes would change the background: as you scroll, once you reach the edge of the first nametable, you go into the second and that's when you can write new data into the first. Since it just wraps around, like a treadmill, the new area will be shown when you get to the end of the second area.

The [pattern table](http://wiki.nesdev.com/w/index.php/PPU_pattern_tables) is, quite simply, where patterns are stored in memory for sprites and tiles. Each byte represents a pixel in the tile, but it doesn't set color directly. Rather, there are 2 bits per color, so that each tile can use one of 4 colors in a predefined palette. Well, really, 3 colors plus a background color, but still.

This is where things get weird. Not weird like it's been so far, no...we're going into the Twilight Zone of 8-bit hardware here.

At least, that's how it feels to me. I exaggerate for effect, sometimes.

This predefined palette lives in a zone of memory called the [attribute table](http://wiki.nesdev.com/w/index.php/PPU_attribute_tables). The memory is laid out like so: each chunk refers to a 32x32 pixel, or 4x4 tile, area. Those 4x4 tiles can _only use that palette_. This creates an interesting effect when laying out tiles, especially "metatiles" which take up more than 8x8 (the NES supports 8x16 sprites, but otherwise, everything is 8x8 and you're on your own if you go bigger).

This is where my knowledge starts to run dry, and my learning journey picks up again. For one, I've yet to find a tool that takes all of these specific requirements into account, with the exception of [yy-chr](https://w.atwiki.jp/yychr/), which is stunted in some ways that make it impossible to use to define your attribute tables, your nametables, and your pattern tables. At best, it could be used to define monochrome graphics, limited to 4 colors for _all_ tiles.

So, like so many old-school console devs before me, this has led me to explore the idea of writing my own tools! Right now, I'm envisioning a single-page web app called ANTE, or "Advanced NES Tile Editor". So far, I'm taking ideas from [Adventure Kit](https://github.com/ajpocus/adventure-kit), especially the pixel art editor. I have at least a moderate amount of experience drawing on the HTML canvas, scaling graphics, exporting the result, etc. so that works to my advantage.

I'll be writing more often, about these NES adventures and beyond. Tune in next time -- same bat-time, same bat-channel!
