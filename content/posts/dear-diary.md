---
title: "Dear Diary"
date: 2020-12-14T17:50:19-05:00
---

This is starting to feel like a diary or a journal, anyway. Today, during the day job at [Hacker Noon](https://hackernoon.com/?ref=austinpocus.com), I was working on something I started late last week: a personalized homepage. 

Most of our users don't even know it yet, but they will soon (read: now): you can get personalized content in your inbox using a tag subscription system I helped build -- if you already have an account, you can just go to <https://app.hackernoon.com/subscriptions>, it's that easy! 

You can also hover over your avatar, and click "Subscriptions" when you're logged in. If you don't have an account, you can [sign up here](https://app.hackernoon.com/signup?ref=austinpocus.com).

Bah, enough marketing crap. So I'm building a personalized homepage! This will, if you have an account, build a list of stories from the tags you've chosen (and suggest others to choose from).

It's pretty interesting how this works, because we're using SSR with Next.js, and with Firebase, you can't get the auth state on the backend like that, as far as I'm aware.

So what we do, is in `getStaticProps`, we query all the stories in the past week. Then, we key them by tag in an object, like:

```javascript
{
  "tag1": [
    story1Object,
    story2Object
  ],
  "tag2", [...moreStories]
}
```

This way, on the frontend, if you're subscribed to a tag and the tag has had stories published in the last week, you'll see those stories.

At this point, I'm experimenting with different layouts, and [Dane](https://twitter.com/duilen) is working on a different sort of story card concept as well -- we're hoping to combine them into a super-update for a more personal, lively homepage.

In other news, I got my structure for the stories working!

[Here's a simple demo](https://codepen.io/austinhocuspocus/pen/xxEqEPK). I'm sure the CSS can be improved upon...I really had to hack it to get the fade out/fade in effect...I'll figure out how to embed examples on Hugo later, so I can show off these demos within the post.

Anyway, it's going well, overall! The notes app I have going here is pretty seamless, getting back into the groove at work, and the interactive story app is coming along nicely -- I basically just have to write the stories, which is a nice place to be.

{{< youtube GIa2QOTyJGw >}}
