---
title: "Parsing Is Too Expensive"
date: 2020-12-27T13:43:15-05:00
tags: ["rants", "vonnegut", "parsing", "compilers", "interactive-fiction", "engines"]
---

To paraphrase Del the Funky Homosapien: "parsing is too expensive".

{{< youtube qbzs3EHPMxg >}}

It seems like every quasi-official source on compilation will point you towards things like Extended Backus-Naur Form (EBNF) and the "Dragon Book", that ever-towering mammoth of compiler theory.

What if I told you...you don't need any of that shit!

Well, Backus-Naur is useful. But all the theorizing? You can cross that bridge when you get there.

The first thing you probably want to do is _define the damn language_ and that's where things like EBNF come in handy (esoteric and thorny though it may be).

There are also tools built on top of or in parallel with BNF, tools like [nearley](https://nearley.js.org/), an implementation of Earley parsers in JS [insert "earley bird" joke here].

Really, Earley parsers are just using another form of Backus-Naur-like syntax -- it all comes down to defining ever more specific groups of text. For example, in psuedo-BNF, nearley-like syntax:

```ebnf
code -> line:+
line -> expr:* "\n"
expr -> math | strings | functions | other_stuff
```

You get the idea, I think. You're breaking down how to interpret a program -- that's it. It helps if you can think of examples as you go. 

For example, you might have a series of mathematical expressions you'd like to be able to parse, which is a great starting point as it gets you thinking about more complex examples as you go.

Or you might have a certain function syntax you'd like to support. If that's the case, this is the place to define it.

Once you have a parser, things get a lot easier. You can take raw text and transform it into a data structure a program can read -- with that, you can either execute or output code, depending on whether your language is interpreted or compiled.

Point is, to get to a parser, to get that baseline that you need, you don't have to jump through so many hoops as people might tell you. Sure, the theory is extremely useful...once you need it. It's worth knowing about how floating point numbers work under the hood, or the merits of C-style strings vs Pascal strings, or what have you. But it's not worth knowing until you can extract that value into something executable. Until that point, it's just trivia, taking up space in your brain. And hell, you might not even end up needing it! Depending on what you interpret in or compile to, that is.

I'm still in the parser definition stage of my interactive fiction engine, codenamed "Vonnegut". I still don't quite know how I'm going to define different aspects of the language, like the "triggers" I defined in my hand-rolled vanilla JS engine.

For example, if you smoke a cigarette, that triggers code that subtracts 10 from your "luck" score. Or if you roll down the window for fresh air, that's +100 luck. Moreover, if you break the window, you shouldn't be able to roll it up or down -- that choice should be hidden. Finally, if you select 2 or 3 options, it should then progress the main story "hub" page to the next scene, the next "act".

Not to mention, I've been thinking about whether text is the place to define this at all. What you really want is a specialized interface for writing scenes, connecting them, setting up variables and triggers...

Maybe what I really want is a GUI that manages the story, along with a human-readable JSON format or something that the story is saved in.

I don't know. I'll probably experiment with some sort of card-based drag-and-drop style interface today. I haven't done much with native drag-and-drop on the web, yet, so that should be interesting.
