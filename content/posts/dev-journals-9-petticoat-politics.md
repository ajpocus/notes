---
title: "Dev Journals 9: Petticoat Politics"
date: 2021-08-28T11:32:14-04:00
tags: ["dev-journals", "adventure-kit", "make-a-quest", "javascript", "typescript"]
---

Today's entry is so named because, 1. there's a movie with that name, but also 2. when it comes to things like Typescript, people get dogmatic and start pointless debates.

What should matter is: what's the right tool for the job? In this case, Typescript is the right tool -- read on to find out why.

Game development involves a lot of data. These data structures have complex relationships, for example, a story can have many quests, a quest can have many parts, and so on.

Moreover, the data shape can determine different requirements. For example, if a story doesn't have any quests, I should specially mark it as incomplete on the dashboard.

Let's back up. To quote Talking Heads: "You may ask yourself: well, how did I get here?"

It started when I began to define the types of data that would be coming through the system. For example, stories have a name, and can have a series of quests. Those quests have a name, and "components" (more on those later), as well as internal state for each instance.

This is a problem that can be solved with OOP principles in Javascript -- I could define classes with this data and behavior. In large part, this is what I did.

Then I stopped and thought: you know, I'm doing all this work defining a type hierarchy, so why don't I reap the benefits of Typescript?

After all, with a little TLC, you can get Typescript to tell you about errors _before your code runs_. That's like magic.

Plus, it'll tell you just what exactly your parameter types are! I don't know how many times I've received an object in a function and had to verify where it came from and what exactly was _in_ it.

The tooling is mature, the language is well-developed and well-supported, and you even get `DefinitelyTyped` modules, better known as the `@types/foo` modules on NPM, which tells you about the types returned by your libraries!

Not to mention: all of this is opt-in by default. You do a 15-minute setup process and boom, you're strongly typed. Set warnings as you wish, set the strictness level to whatever you like, but by default: you don't have to type _anything_ you don't want to. Take full advantage of all Typescript has to offer, or let it sit in your pipeline unused -- as Black Sheep said, the choice is yours!

Anyway, I think it's about time I got back to my codebase for `make-a-quest` ([it's open source now!](https://github.com/pocuslabs/make-a-quest)). Time for a little TLC.

{{< youtube 8WEtxJ4-sh4 >}}
