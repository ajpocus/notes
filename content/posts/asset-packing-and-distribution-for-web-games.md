---
title: "Asset Packing and Distribution for Web Games"
date: 2021-05-27T11:20:58-04:00
tags: ["adventure-kit", "hounddog", "ladybird", "thought-dump", "asset-management", "encoding"]
---

Bundling assets with an excutable script can be a challenge, given certain constraints. If I wanted to distribute an executable file that also contains assets, it's a breeze natively, but how does that work on the web? In this post, I'll just be thinking "out loud" about the problem of asset distribution for web games.

The obvious answer here is to use a cheap CDN and refer to assets remotely. This is undesirable for a few reasons, the biggest reason being that I want these games to be self-contained and playable offline. So that rules out any sort of remote resource access.

These games should also be embeddable pretty much anywhere on the web, on any web page that you control (not Twitter or Facebook, but a personal site running on any platform). This means you want the file or `<script>` code that you're distributing to be small, and executable by the browser's JS engine. It also means that an `iframe` that simply points to the game could be problematic (and violates the first rule regarding remote access).

Not to mention, I had originally planned on supporting WAV files, MP3, flac and ogg, and everything else for audio, as well as various graphics formats -- large files, in other words. This leads us to all sorts of potential solutions involving self-deflating executables and [steganography](https://en.wikipedia.org/wiki/Steganography) in PNGs, but first, let's ask:

**What is the problem I'm trying to solve?**

Too often, we get caught up in solutions (myself included), and trying to figure out how to get a given solution to work, rather than backing up and asking ourselves this simple question. And all too often, asking this question can lead to a simpler, better solution.

So let's answer it! The core problem is that I want the maker to have easy access to assets on their local machine, and when they run a build command, a simple method to distribute them with the game they make.

I'm also planning on making this an **old-school** game engine, meaning the games will have certain graphics and audio constraints! So, given that, I don't really _need_ to support arbitrarily large files in any format under the sun. This changes _everything_, because suddenly:

- I no longer have to worry about hiding a humongous bundle in a PNG or something.
- The assets will be much simpler, lending themselves to simple and effective encoding and compression -- small assets are awesome!
- I need some common, simple, format for both graphics and audio, that can be byte-encoded in some form inside the script file. The script file will be able to decompress this on load.

That last point is a solution to the problem, but it follows from the constraints and implications of the original problem, so that's ok! I just need to carefully consider my options and not paint myself into a corner.

So, for graphics, I could use PNG for sprites/spritesheets. As for music, I could accept WAV files. But this only begs the question: how do I enforce the constraints in the engine, if I'm accepting arbitrary formats?

It makes more sense, in a way, to provide the tools to make these assets myself and store them in a custom, space-efficient format that can be easily encoded into an executable script file. Of course, this would mean I'd have to write more code to build more tools, and isn't ideal.

Maybe I can enforce certain parameters on the files themselves? For example, I can assert that only 8x8, 8x16, and 16x16 sprites can be made using the PNGs provided. Or I can limit a WAV file to a given bitrate, to ensure an authentic lo-fi sound.

I'll have to do more research on formats later on, to make sure this is feasible. For now, I can just accept PNGs and WAVs, limit the size, and figure out the rest later on.

One other idea that crossed my mind was to use an existing synth format and emulate that synth. For example, accept the Game Boy music format and just let people use one of the several available sequencer apps for that chip. I might still do that, I don't know. We'll see.

One of the trickier aspects of all this, is to limit the number of pixels or the types and numbers of waveforms available, for the graphics or music. I might end up creating custom formats for the new Adventure Kit! But first, I'll just experiment with small WAV and PNG files that meet my loose specifications above.

And that, dear reader, is why you always ask yourself, **what problem are you trying to solve?** Ask it of yourself, and any teammate who comes to you with a solution in mind. You may be surprised at the result.

This has been another live debugging session -- tune in next time for more info on the latest incarnation of Adventure Kit!
