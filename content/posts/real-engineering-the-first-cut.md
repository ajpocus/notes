---
title: "\"Real\" Engineering: The First Cut"
date: 2021-05-16T14:29:08-04:00
tags: ["3d-modeling", "engineering", "making", "creative-software", "physics", "3d-printing"]
---

This will be a draft about drafting. Not drafting like in a war, but drafting like in engineering and architecture: making blueprints. More specificially, it's about my experiences so far with Shapr3D on the iPad, as a complete novice.

I haven't given up on [the NES effort](/posts/the-long-strange-trip), by the way. I'm still working on a rendering engine for that project, and I fully expect it'll take me into the next year, but I _had_ to make something to 3D print! Consider it a shorter-term project.

See, I recently got access to a 3D printer. I'm still waiting on a filament spool delivery, but shout-out to [Prusa Research](https://www.prusa3d.com/) for their excellent products! I'm not being paid to say this -- maybe I should be -- but my first experience with the Prusa i3 was a complete sense of wonder and creative freedom, with this magical machine. I'm sure the Mini+ will be a joy to work with as well.

Anyway, enough with the free advertising! I got access to a 3D printer, and quickly discovered I wanted to make something, something more interesting or useful than a toy boat or whistle. So, what to do?

That part was easy: **a wind-powered music box**.

It's something my dad came up with, maybe a year or two ago, a music box that plucks strings.

First, let's start with a screenshot of an earlier iteration:

![An early model of my 3D printed, wind-powered music box](/img/3dmodel.jpeg)

I've since changed the layout, since the design here won't work as I imagined, but the concept is relatively easy to visualize in motion, even without a screenshot. There are wind vanes on the bottom, paddles essentially, that will revolve around the z-axis (up and down) with the blowing of the wind.

This rotary motion will spin bars at the top and bottom of the main chamber, which houses a ring (or multiple rings) of guitar strings. These strings will be tuned to different notes, using tuning heads on the top (these can be purchased at any music shop). There will be a pick attached to each bar, and as the bar turns around the chamber, it'll pluck each string in the ring.

I've learned a few things from a day of designing parts for this music box, yesterday.

First, I've learned that engineers, real engineers who design physical machines, have a really cool and challenging job (I knew this already, I suppose, but never really _thought_ about it).

Second, I learned that I am not an engineer. Software Engineer, sure. But that's like apples to oranges, comparing Software Engineers with regular Engineers -- we do **completely different things**.

I also learned that 3D modeling software is expensive! I'm using the free version of Shapr3D on the iPad right now, and I might pay for a year (more on that soon), but jeez Louise is it pricey! It's more expensive than Photoshop on a monthly basis, and that's not even the most expensive software out there! Some of these licenses, for a lifetime usage license, can run into several thousand dollars.

More importantly, I learned that 3D modeling software, such as Shapr3D, has quite the learning curve, but is more powerful than possibly any software I've ever used. And I've used a lot of software! There may be exceptions, like Unity Engine or Unreal, but I've never been able to use such powerful software to such great effect.

The nice thing about Shapr3D is that they make it easy to get started. You start in 2D mode, draw a shape, go to 3D mode, select, and extrude (or draw out) the material. This creates a 3D object!

You can also run a shape, like a circle, _through_ a 3D object in order to remove material, even creating a hole all the way through. This is how I designed the original tuning heads for the strings, before I realized I could buy them pre-made on the cheap.

Anyway, there are a lot more tools I have yet to discover. For example, there's the "revolve" tool, which can be used to make a helix (like if you're making a screw, or some sort of spiral structure).

I face many challenges from here, if I actually want to make this thing.

First are the design challenges: I found early on that the screenshotted design above won't work, for example. This is because if there are multiple picking bars going down parallel to concentric circles of rings, the tuning head assembly would have to be below those bars. This makes for a difficult tuning experience -- I want the tune to be easily changed, and I don't want anyone to have to take the thing apart just to tune the strings or replace them.

Another potential issue is the repetitive nature of a few notes playing a simple melody over and over. I've mitigated this to a degree, settling on an initial assembly of 16 strings in a single circle. You could feasibly tune to different melodies on a daily basis, if you tire easily of the sounds being made. In a far-future iteration, maybe I'll use part of the wind power to automatically retune the strings on each revolution, but that's sort of a pie-in-the-sky dream right now.

Something to consider as well is the nature of a wind-powered device: the melody should sound interesting backwards as well as forwards. This is more of a musical issue than a physical engineering problem, **but** it does inform how easy it should be to tune the device.

Ideally, you wouldn't have to drag out a guitar tuner and go to a quiet place to tune each note, but rather, the tuning would be made easier _by_ the device itself.

This calls for a digital tuner apparatus!

You could feasibly have a model that allows for a tuner to be attached, with a little Rasberry Pi or Arduino processing the data...that's a "later" problem though. What you _really_ want is 1. to be able to use any guitar tuner and 2. there should be predefined patterns that anyone can interpret, that allow you to change the tune in a few minutes, with simple instructions, given no experience.

All of this tuning talk is putting the cart before the horse, though. I have to start simple, which means simple parts, simple operation, a simple design.

Ultimately, I have a design that's more complex but offers more opportunity for complex melodies, a spiral-based design that I had tried at first but found myself unable to design using Shapr (due to lack of experience). Eventually, I'd like to collaborate with a local woodworker or get time in a wood shop, and make a wooden version that I can varnish, or paint.

But for now, I have to get a prototype up and running. Til' next time...
