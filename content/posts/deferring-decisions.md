---
title: "Deferring Decisions"
date: 2021-02-09T20:47:14-05:00
tags: ["philosophy", "rants", "decision-making", "how-to-think", "chats-with-dane"]
---

It all started with a todo list.

The idea was to create a live updating todo app that could be shared by simply copy-pasting the url. Easy, right?

Except I started to get ideas, branches off of the main road. In one case, it was a potential rabbit hole, but as I described [in my last post](/posts/what-bob-ross-teaches-us-about-making-things), I got past it.

This time, I'm dealing with a similar problem, a similar constraint, a roadblock I couldn't seem to get around until I reimagined the way things should work.

Let's back up.

The app is simple: you paste urls of things you want for your birthday, or Christmas, or Hanukkah, or what have you, and as items are checked off, the list is updated in real-time (or near it). The list's creator won't see which items have been bought, unless they peek at the special sharing link where you can tick items off the list.

Problem is, some sites don't play nicely when you try to fetch the url they give you, and read metadata like the page title, description, and maybe an image. My solution was to prompt the user for a gift name when the metadata cannot be fetched, which seems like a reasonable solution, but my approach was flawed.

Looking back, it was really a state management issue -- I had to preserve the item state, url, etc. between components, between the modal and the form components specifically, which sounds like it was leading to, as you might guess, a React context.

This is way too complicated.

And it all springs from the **decision** to prompt the user for a title, when one cannot be fetched. There's a better experience here, if I'm willing to give up certain assumptions or guarantees, if I'm willing to restructure that part of the experience.

I had foolishly made the assumption that, "of course you'd want to prompt the user after they enter a url, so we can fill it in for them if we're allowed to fetch the metadata!" but my first solution was poorly implemented. It made a **decision** about the UI that could've easily been changed, which would come with its own set of different constraints.

The better experience would be to do the following: Prompt the user for a url, with a button next to it (or they hit enter) to submit the form. At that point, if the url does have metadata, we create the wishlist and fill in the title with that metadata. If not, the form expands a bit, to include a text input prompting the user for a name for the gift. Once a gift name is entered, _then_ we create the list and redirect to the list page.

It's often hard to describe a user's interaction with a website in words. All the same, all I need to do is restructure the way the form works, on the homepage, with regards to state management and item creation. It's not too hard of a problem, since I started less than a week ago.

I haven't made the decisions that come with a long-lived codebase, so I have a lot of choices. These choices diminish over time, especially as you make big decisions.

By rethinking the problem, by looking at it from a different angle, I was able to free myself of the constraints, the roadblock, I had previously faced, sidestepping it almost entirely, by just looking from a different point of view and thinking through the experience, the UX.

I left my available future choices more open by **deferring the decision**. This is something that my friend [Dane](https://v1labs.com) taught me, that you don't have to worry about something until you have to worry about it. This might be a tautology, but it rings true.

This is not to say you should ignore things that need attention -- quite the opposite. It means that you should avoid painting yourself into a corner by deciding on things that aren't in the **here and now**.

I'm not saying you shouldn't think about the future. Just don't get "analysis paralysis". I would write more on this topic, but it's such a huge topic that touches so many aspects of decision-making, thinking, and problem solving at their respective cores.

> There is a time for being ahead, a time for being behind; a time for being in motion, a time for being at rest; a time for being vigorous, a time for being exhausted; a time for being safe, a time for being in danger.

-- Tao Te Ching, Chapter 26

Or, if you prefer:

> For everything there is a season, and a time for every purpose under heaven: a time to be born, and a time to die; a time to plant, and a time to pluck up that which is planted;

-- Ecclesiastes 3:1-2

Or if you're really cool:

> To everything (turn, turn, turn)
There is a season (turn, turn, turn)
And a time to every purpose, under heaven

-- "Turn! Turn! Turn!, by The Byrds

I could write more on this, but I think I'll defer it. The time is for coding.
