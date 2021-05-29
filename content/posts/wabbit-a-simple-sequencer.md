---
title: "Wabbit: A Simple Sequencer"
date: 2021-05-29T13:09:47-04:00
tags: ["gamedev", "audio", "dsp", "synths", "adventure-kit", "hounddog"]
---

Wabbit is a sequencer borne of necessity. For the [game engine and tools I'm making](/posts/the-foxie-language-and-the-hounddog-engine), it's essential to define the sound and spirit of the games being made. Follow me down the "wabbit" hole, as I explore the limitations and capabilities of this new, old-school audio engine.

I say "borne of necessity" because normally, especially with a project of this scope, I'd look for tools that can provide what I need, something already built! In this case, though, I _need_ to reinvent the wheel -- the existing wheels don't fit my hub.

In other words, no existing sequencer met my requirements of ubiquitous tooling, control over the sound limitations I'd like to impose...it would just be a mess. I briefly considered SID, the old Commodore 64 chip format, since there are plenty of sounds, lots of enthusiasts, and I thought there would be tooling to match, but the ecosystem was lackluster at best. Not something I'd call beginner-friendly.

So the first thing we need with any synth is sound, and a way to create it. For me, this has already been done in large part in the original incarnation of Adventure Kit.

At least, I can reuse the mapping of keyboard keys to notes. Even with this base, we can improve. For one, Adventure Kit was _fully_ polyphonic, meaning you could play as many notes as you could reach, as many as practically sounded good.

This was usually less than 4! Any more than that and you'd get distortion and [clipping](https://www.youtube.com/watch?v=COSPHLq8y98), creating an OscillatorNode through the Web Audio API for each note. I don't know how it mixes the sounds, internally, but I'm probably just doing it wrong...but that's not the point.

Point is, this time around, I'm going to have several limits in place, namely: 4 voices, 4 sounds or loops you can play at once. Each voice can play a basic waveform, like a sine, saw, triangle, or square wave.

The volume range will probably be somewhere in the neighborhood of 32 possible values, 0 being muted and 31 being the max...I still haven't nailed that down though. Let's not get lost in the woods here -- let's take a higher-level view of things.

With this sequencer, we'll have a few recording modes to work with (when I say "we", I refer to you and I, or makers in general). The first will be the traditional "[step](https://www.youtube.com/watch?v=Rt9Ld58OgEo)" sequencer mode of operation, where it doesn't matter how long you play a note -- each keypress fills in one fraction of the beat, whichever "fraction" you define (1/4 note, 1/16 note, and so on).

Now things get more interesting: we'll also have "fully quantized" mode, or just "quantized" mode, which will fill in quantized versions of the note you're playing. So if you hold down a middle C, it'll just fill in 1/16 notes with that value, or whatever other fraction you define.

Then things get interesting: the last mode is my favorite, semi-quantized or "live" mode. In this mode, whatever you play will translate into what you hear, but rounded to the nearest note. So if you're 1/32 of a beat "off" on the last note, it'll round to the nearest 1/16 (or 1/4, or whichever quantization value you choose).

I like the last mode the best because 1. it's how most people naturally play, but 2. it also keeps mistakes to a minimum for inexperienced musicians (most of us, myself included). I mean, I noodle around on the keyboard now and then, but rarely, and my timing is pretty garbage. Quantization as a mode is extremely appealing for that reason.

Purists may cry foul, but hey, cry me a river -- music shouldn't be limited to the people with the physical dexterity to perform, but should be creatively available to anyone who has an idea for a melody, harmony, or even just a cool sound effect!

Sounds should be up to a certain length or size, say 10 minutes or 5MB each, whichever comes first. They should be able to loop (although I'm not sure this should happen in the sequencer -- maybe the maker can loop it when the sound is triggered?). It might actually be nice to loop in the sequencer, such that you loop a melody 4 times per verse, then loop another sequence twice for the bridge...

See, I'm getting lost again. Going deeper instead of "walking back up the tree". I'm going depth-first instead of breadth-first.

I mention these format options because the music is either going to have to be in WAV format (with loops "unrolled", if necessary) or a smaller binary format...I'm still weighing those options but the key thing is to not [paint myself into a corner](/posts/deferring-decisions).

Overall, what I need to do next is just get keypresses playing sounds. From there, waveform selection, and from _there_, I'd love to get the semi-live mode working. Though I may need the step mode or fully quantized mode first...we'll see as it comes.

Until then, I'll be coding. Tune in next time, same channel!
