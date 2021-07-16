---
title: "Everything but the Kitchen Async"
date: 2021-07-14T19:02:43-04:00
tags: ["dev-journals", "adventure-kit", "python", "win32", "ipc"]
---

This is the start of a series of journals, hopefully daily, that will roughly chronicle my progress on the Adventure Kit prototype. Let's dive in!

First, I'd like to just outline the structure of these [`dev-journals`](/tags/dev-journals). It's a way for me to sort of "debrief" at the end of the day, to report on what I did and where I need to go from here. It's largely a tool for myself, but I figured it may also be interesting to people who want to read about the development of a tool as it happens. I won't be doing much editing. 

Today involved a lot of learning around the `asyncio` module in Python. I'm running between reading documentation and translating examples into code I can actually use -- I think I need to take tomorrow to really do a slow deep-dive into the documentation and understand the inner workings of Python's async facilities as best I can.

This gets tricky, because I'm using `asyncio` alongside existing event loops, namely the Qt and Pygame event loops (I'm using PySide for the Qt integration). This influenced the design of the inter-process communication system quite a bit.

You may wonder, "why is IPC necessary?" and that's a very fair question. In short: Qt and Pygame (SDL) both contend for the screen's attention, expecting to "run the world", so to speak.

For example, let's say I have a Qt window. That Qt window expects to "own" the screen, and what that translates to for the programmer is that all UI action has to happen on the main thread. Ditto for Pygame, or the underlying SDL.

This is one of the few times I've actually had to deal with the real implications of threading, having dealt largely with Javascript and the web for years -- Javascript is inherently single-threaded.

I've dealt with threading in Java and Objective-C, naturally, developing for mobile. But I haven't written for mobile in several years. Aside from that, I had a brief experience translating C# into JS (which was interesting when it came to parts that ran outside the main thread...but that's another story!).

Anyway, I have a basic design for the system in mind. The main thing is to have two processes: one for the engine, and one for the GUI that talks to the engine. So how do they communicate?

There are two channels we can use to send data from one process to another. First, there's the main channel for graphics data to be sent each frame. This has to run in about 16 milliseconds for 60 frames per second, or about 32ms for 30 FPS. I think 30 is perfectly reasonable for an old school game, so let's settle on that for now.

This main graphics channel will use Python's `multiprocessing.shared_memory` module. This is basically a memory mapping directly to volatile memory (RAM). As far as I'm able to tell right now, this is more powerful and easier to use than the `mmap` module, which is a mapping to a file on disk (to the best of my current knowledge).

So we have a way to feed graphics data from the game engine to the GUI -- that's a one-way connection, so nothing _too_ complicated has to happen there. The hardest part of the setup is getting the graphics dumped into a buffer format that Qt can translate into an image, but I think I have that part set up okay.

The harder part is sending signals back and forth between the GUI and the engine. I am about 90% sure I'll be using a TCP server using the `asyncio` module to communicate.

The basic setup is this: the server will live on the game engine, and the GUI will make requests via the client. The setup is nicer than simply using a memory-mapped file or chunk of RAM, since we can define which signals are being sent, send data along with the request, and so on.

For example, let's say we have a slider in the GUI to control walking speed. We may also have toggle switches for options like "walk by tile" or "walk by pixel", lists for user-defined character attribute strings, or multi-selects, or any number of widgets controlling engine behavior.

We'll send the "update" signal whenever the data is updated via the GUI, and this should be reflected in the engine. The `asyncio` connection is the channel that data will travel over.

On the other hand, maybe the user wants to reboot the game, to see how a quest script has changed the gameplay! That could be another type of signal.

There may also be changes that the game can't possibly react to on-the-fly -- maybe you change the battle system on a fundamental level, and it would be too complicated to write change handlers into every single part of the engine to handle things like going from turn-based to action-based battles. In those cases, you'd want some sort of "hard update", one that reboots the game (with a warning, of course, to make sure you don't lose your progress).

The hardest part of all this is going to be tying the `asyncio` module into the event loops that already exist in Qt and Pygame, as I mentioned earlier. I don't know a lot yet about how to handle async function calls in Python, so I have some reading to do.

That's about all I have for today -- much of the day wasn't writing code so much as thinking about how these two processes were going to interact.

Tomorrow, I think I'll be doing more reading than writing, especially in-depth reading about Python's async facilities. Stay tuned for more updates!
