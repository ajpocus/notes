---
title: "Dev Journals 5: Return of the Journal"
date: 2021-07-30T13:00:31-04:00
tags: ["dev-journals", "adventure-kit", "python", "qt", "ipc"]
---

I've been a bit under the weather, the past week or so, but I've been making progress on Adventure Kit, including an important milestone!

First, the milestone: I have a GUI process that uses Qt, which spawns a headless child process for the game engine. Using Python's `multiprocessing.Pipe` tool, I'm sending frame data from the engine to the GUI, and I'm sending keypresses from the GUI to the engine. 

This results in a picture, a character I can move with the arrow keys.

And it works! I can move the player, sending signals to a headless game engine and getting a picture back via IPC. This is more exciting than it sounds, especially since so much was involved in learning how to do IPC in Python, between Windows and *nix systems like macOS. This is really a new world to me.

The next step in building this program is to change _something_ using a GUI widget -- walking style (pixel vs. tile), walking speed, background color -- and reflect that in the game preview when the changes are committed.

This brings up an interesting point in my GUI development: I have no idea what I'm doing with Qt, but I'm pretty sure I'm doing it wrong.

I say this because I have no definition of my GUI's layout thus far. I have a simple window that loads one "central" widget that renders the engine results.

In other words, I have no "layout" to speak of, and it's all done programatically, not using a `.ui` file created by Qt Designer or what have you.

I'm still learning about how to handle that bit. I want to use custom widgets, which apparently complicates things...but the main thing I need to do now is read the Qt documentation more carefully, and learn how this is done using Python and Pyside6 (the official Qt bindings for Python).

When I find out, I'll report back. 'Til then, we now return to your regularly scheduled programming.
