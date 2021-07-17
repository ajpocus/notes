---
title: "Dev Journals 3: Thunder Down Under"
date: 2021-07-16T20:15:29-04:00
tags: ["dev-journals", "adventure-kit", "gamedev", "python", "ipc"]
---

Today was a major milestone: I got Pygame to render in a Qt-powered window! Here's how.

First things first, I did keep to my word and started the day by "thinking slow", reading in-depth documentation regarding the behavior of Python with regards to processes and threads (the threading was surprising!).

See, with the Global Interpreter Lock, known to seasoned Pythonistas as the GIL, your threads will only execute one at a time (so much for getting experience with threads...).

As I understand it, this exists mainly to offer certain guarantees about memory safety, which has me missing Rust just a wee bit, but hey, the situation is workable. I mean, you can use threads for I/O-bound tasks, and use the `multiprocessing` module for CPU-intensive stuff.

That's the short version, anyway. There's really quite a few ways to run code concurrently in Python, including, but not limited to:

- the `multiprocessing` module
- the `os` module and raw process spawning
- the `threading` module
- the `subprocess` module

You get the idea.

What I ended up using is the `multiprocessing` module, making use of the `Process` and `Pipe` classes to spawn a new process and send messages back and forth between parent process and child process.

This turned out to be way simpler than I thought. For one, I didn't need the `multiprocessing.shared_memory` stuff like I thought I did, which rules out all sorts of funky lock scenarios that I don't even care to get into.

I pretty much just spawned a process by feeding it a `target` function, which it would run when started. This process would receieve a `child_connection` variable that I pass to it (created by the `Pipe` class).

Back in the parent process, I had a parent connection object as well, and I could send or receive data using either connection (using the default duplex piping).

I might need to set up an `asyncio` client/server model, to send more complex messages...right now I basically have a catch-all `recv` function that receives **all the things** that are sent. That's fine for frame data, and it works _fast_, but it's not exactly what I need for the rest of the program.

At least now, I know generally what I need to proceed:

- Forward the key events from Qt to pygame to move the character
- Create a slider for e.g. walking speed in Qt
- When that slider changes its value, configure the pygame process

That should be enough to keep me going for the next week or so, as I feel my way around Python. I have a book coming, at least: _Fluent Python_, by Luciano Ramalho. Hopefully, that can help shed some light on some of the corners of Python that are less-discussed in the documentation.

Mind you, I would **not** call Python "poorly documented". In fact, it's right up there with Rust as one of the best-documented langauges available. Just wanted to make that clear. 

Rather, I'm learning many APIs at once: the Python standard library, the pygame API, and Qt. The standard library is pretty great -- the others do a good job of explaining the fundamentals, don't get me wrong, I just think I'm doing something weird that the documentation authors haven't really considered as something worth documenting. That's my fault, not theirs.

So I continue on my journey, stumbling through the brambles of unfamiliar territory. Will our caped crusader leap from the serpentine swamp, and find success? Find out tomorrow, same bat-time, same bat-channel!
