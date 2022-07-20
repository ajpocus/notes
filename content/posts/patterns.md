---
title: "Patterns"
date: 2022-07-18T14:05:55-04:00
tags: ["language-design", "dev-journals", "javascript", "python", "audio", "dsp"]
---

Man, it has been a _while_ since I've written one of these. So I'll dive right in: lately, I'm thinking about how to branch out from the Javascript-centric ecosystem I've been working in over the past few years.

I'm feeling boxed in by my sole use of Javascript as my language of choice. I started to explore languages within the realm of, or adjacent to, the web. Specifically, I've become interested in PHP and Python.

This has led me to start comparing programming languages. As I've thought about [designing my own programming language][1] [on this blog][2] [a few times before][3], I'm naturally thinking about features and language characteristics that are shared, and those that set a language apart.

What really inspired me to write this post was noticing the features that Python has picked up since I last used it. [Structural pattern matching][4] is a fantastic example, borrowing an extremely useful language feature from Rust. How did I miss this?

But what am I getting at here? What's the purpose of this post?

For one, I've missed out on some key developments in programming languages I used to know well, or at least, I thought I knew them. PHP is another great example here -- while I always thought of PHP as a slightly more well-behaved Perl, more geared towards CGI and old-school web dev, that couldn't be further from the truth. Modern PHP, so far, has been surprisingly robust and effective. It draws more comparisons to Ruby + Rails than Perl, especially with frameworks like Laravel.

It's led me to question where I want to spend my time writing code. Is it React frontends? I think I've gotten into a rut there. Maybe Python audio analysis? Or PHP web dev? Maybe a return to Rails?

In any case, I think I need a plan.

The most interesting thing to me, right now, the thing I'm most likely to sink my teeth into and finish, is audio analysis using Python. Specifically, I want to hum or whistle a tune, and translate that into MIDI or sheet music.

Let's narrow that down. I want to whistle and get MIDI. I've [done something like this before][5], but it was honestly half-baked. It was very raw, having a few flaws:

For one, it could only work on pre-recorded WAV files. You had to record a short clip and run the program on the command line. There, it would output raw MIDI. For those unfamiliar with the world of audio files, this is really low-level stuff, something you would feed into an existing synthesizer or digital audio workstation.

There, we would finally be able to hear the product, which was...not the _most_ accurate rendition of whatever was whistled. Sure, the notes would be mostly right, as long as you were within a half-tone or so of the "perfect" frequency. But it had a lot of holes.

So what's the difference this time around?

First, I would love to make this more of a real-time user-friendly application. The app should open a window where you can record, see a visual representation of the notes recorded, and play back any part of the result whenever you like.

Second, I'd like to use some sort of machine learning technology like [PyTorch][6] to fine-tune the resulting notes. This could be as simple as fixing individual notes that are sharp or flat, or it could be smart enough to learn how sharp or flat you are over time, or it could learn the difference between an error and an intentional pitch bend (like when a guitarist bends a string).

Eventually, I'd love to see auto-transcription of musical instruments being played, as the notes are being played, a sort of "smart musical assistant AI". But that's a long way off.

Right now, I'd just like to get a solid MIDI signal out of my random whistling. I come up with some neat little melodies every now and then, and it would be great to capture that and maybe turn it into something musical.

Related side idea: a beatboxing translator, an app that takes beatboxing and turns it into a MIDI drum loop. But that's another project for another day! I've got enough to do for now.

Tune in next time -- I should be writing something new within the next few days.

[1]: /posts/the-foxie-language-and-the-hounddog-engine/
[2]: /posts/zig-as-implementation-language/
[3]: /tags/adventure-kit/
[4]: https://peps.python.org/pep-0636/
[5]: https://github.com/ajpocus/bloopy
[6]: https://pytorch.org/
