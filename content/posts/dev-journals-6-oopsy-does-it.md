---
title: "Dev Journals 6: Oopsy Does It!"
date: 2021-08-01T18:24:23-04:00
tags: ["dev-journals", "adventure-kit", "python", "qt", "tkinter"]
---

If you're wondering, yes, the title of this post is derived from [the 6th _Care Bears_ movie](https://en.wikipedia.org/wiki/Care_Bears:_Oopsy_Does_It!). And yes, there are 6+ movies.

Today's journal is titled in such a way because I tried an experiment that went wrong. Still, it's progress. Read on for details!

In short, I had explored simplifying the code drastically, after running into complications with Qt.

See, Qt is a complex system with a long history of various formats, including Qt Designer-based `.ui` files. That's what I was working with before.

Now, I realize that the way forward is with Qt's QML language. But before that, I tried a different tack.

I tried redoing my UI using Python's `tkinter` module.

This may sound crazy, but bear in mind, I'm in prototype mode! Less than that, even. Proof-of-concept mode. I need the simplest route possible.

That means, in Python GUIs, using the `tkinter` module. With all this complication involving markup languages and linking markup with data...maybe I should just use Tcl/Tk?!

First of all, Tcl/Tk is a _weird_ toolbox. The langauge is defining UI elements almost in a procedural fashion, where I'm used to declarative, which is just strange in my mind.

Anyway, aside from the linguistic oddities around Tcl/Tk, I was hyped to learn tkinter and its intricacies, but more importantly, its "up-and-running-in-5-minutes" tutorial.

In other words, I wanted to see what a raw test sample of tkinter code could do, given very few constraints or structure around the code. I wanted raw speed, raw design, a raw example of the capabilities of tkinter, to see if it could be integrated with pygame effectively.

I started by following an example on Stack Overflow, which directed me to change some pygame variables related to SDL -- this would allow the virtual screen to render inside my tkinter window.

This is where things go awry.

That would've been all fine and well, except pygame wasn't able to hook onto _part_ of a window -- it was all or nothing.

Worse yet, it demanded sharing the process with tkinter! This means having two event loops, which is just bonkers. It's asking for trouble, like a "kick me" sign on the back of my code.

I explored turning the frame into an encoded image, a series of bytes I could pipe over to tkinter and display, but it doesn't look like it supports the same format that pygame outputs.

Besides that, at that point, I might as well bite the bullet of complexity and keep learning Qt.

So now, I'm learning the ins and outs of QML, learning how to declaratively design more complex interfaces using Qt.

It seems no matter which way I slice it, complexity is creeping in. I'll have to keep an eye on that.

Anyway, 'til next time, keep your gremlins dry.
