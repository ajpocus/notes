---
title: "From Rustacean to Pythonista"
date: 2021-07-13T14:31:21-04:00
tags: ["rants", "thought-dump", "python", "rust", "adventure-kit"]
---

At this point, I'm proud to say I'm a Pythonista (again), though I do still enjoy me some Rust. This is the story of how I rediscovered my love for Python.

I first tried Python on version 2.4, I think. I remember 2.6 coming out was a big deal, and people were starting to worry about the break that would come with version 3.

My experimentations were a mess, in short. I used Python briefly, to experiment with Linux APIs, and in what I have to admit was an experiment that ended too early: I plugged my guitar into the computer, recorded the soundwaves, and used Python to analyze the frequencies (thus giving me the note played). There were complications that ended that project prematurely, but that's another post.

I used Python to make a few "web apps" too (read: server-heavy web pages with a wee bit of JS). I still maintain that the Django docs have **the best** documentation in existence for any software project, with the possible exception of the official Python documentation. Even so, I drifted towards the more popular combination of Ruby and Rails, and never really looked back.

So what led me back to Python? I hadn't used it in years, after all. Well, it all started with Adventure Kit, the toolkit I'm making to make your own old-school RPG.

My first thought, in trying to build a desktop app for Windows, was to use one of my favorite languages: Rust! 🦀

I still consider myself an amateur Rustacean, but let's face it: Rust is still lacking when it comes to user applications especially, glaringly, the desktop GUI...it's [well-known in the community](https://www.areweguiyet.com/), and I do not fault any of the Rust community for even a split second. These things take time.

Sure, I could use some of the Qt or GTK bindings out there, but ideally, I want something that's tailor-made for the language I'm using. Not something bolted on after the fact. Sorry, fellow Rustaceans. Maybe in the final version, I'll be able to use it! But not for this prototype, this proof-of-concept.

Now, for a horror story...hide yo kids, hide yo wife, it's...**C++**! 😱

Nah, it's really not all _that_ bad. Then again, I feel like I'm defending my friend who I brought to the party, and my "friend" was actually an anonymous drifter with bugged-out eyes who danced on the table while we were eating and pissed in the punch bowl.

So in my defense, I would like to state a few facts about C++:

- C++ is a powerful programming language.
- Recent additions to the language have made it easier to work with.
- It has SDL bindings for free, given its close ties with C.
- The Windows APIs are accessible from C++.
- C++ is quite popular with game developers.

Again, I feel like I'm defending my decision here, when in reality, it was a sane decision on the face of it. I'm making a game engine of sorts, with Adventure Kit, so I should use a language that people use for game engines.

And again, this all _seemed_ like a great idea at the time.

Turns out, C++ is not the best language for prototyping (surprise!). I thought I could build a minimal proof-of-concept with the language, but Jesus-tapdancing-Christ, there is so much you have to _do_ to get anything _done_.

That's when it hit me: prototyping == Python!

Python is _made_ for prototyping and early concepts and that sort of thing. It has the Pygame library, which is basically a thin veneer over the SDL API, which I consider one of the best tools ever created for programmers.

Seriously, if you want to teach someone programming, Python and Pygame are a good choice for tooling. But I digress.

Python also has solid Qt bindings that _feel_ Pythonic, i.e. they feel like they're a part of the language (yes, yes, I _tried_ tkinter, but it's hard to get it to play nice with Pygame).

That's actually the biggest challenge I currently face: getting the GUI and the game engine to play nice.

I'm currently designing a mini-architecture that will allow each part to run in its own process, one for the GUI and one for the game engine. From there, I'll most likely use some form of "shared memory" via Python's `multiprocessing.shared_memory` or `mmap` modules (processes can't have true shared memory -- that's for threads -- but that's for another day).

I'm still hashing out the details in my head, but that's the gist of it. I'll also be leveraging Python's `asyncio` module, which is new to me and honestly quite awesome.

I'll have to write more on my journey with Python later on. For now, enjoy this 100% relevant blog soundtrack:

{{< youtube Pr9SQri2884 >}}
