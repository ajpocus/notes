---
title: "Deploying Hugo With Github Actions"
date: 2020-12-14T20:21:13-05:00
---

I figured out how to deploy Hugo with Github Actions, and I figured, well I can't keep _this_ to myself.

Here's the Github action template:

{{< gist ajpocus 3f6eae39f6012146dc6f6785991a0c22 >}}

And here's the deploy.sh script that's referenced in the action template:

{{< gist ajpocus dd7b2f49cc71554ce9b1ce6e0bddd5a2 >}}

With this action in place, you can pretty easily set up a Markdown site that compiles to static HTML with every `git push`!

![Matt Damon delivering the famous how do you like them apples comeback](/apples.gif)
