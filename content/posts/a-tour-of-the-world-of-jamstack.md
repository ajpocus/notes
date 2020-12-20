---
title: "A Tour of the World of JAMstack"
date: 2020-12-19T19:53:32-05:00
tags: ["jamstack", "rants", "web", "tools", "javascript", "meta"]
---

I've been doing some exploration, when it comes to site generators...at this point, I've tried nearly every major JAMstack tool out there. I think I have two favorites, at this point. If you want, skip to the end, but you'll miss a ton of ridiculous self-deprecating rambling, so...your loss, if you do.

## First things first: the use case

I'm covering what they call "site generators", not the headless CMS group of the JAMstack collection of frameworks and tools. That said, [Ghost](https://ghost.org/) totally blows the competition out of the water in my mind and everyone should try it for their blog sometime. It's really a nice experience, even for non-technical folks, I think.

Beyond that, I'm actually looking for a static site generator, simply turning templates into static content, maybe with a little bit of vanilla Javascript for interactions. I'm not looking to build a SPA right now. I'll still talk about those, but just take those with a little grain of salt, since I'm not looking for web app stuff right now, necessarily.

Let's get to it.

## Gatsby: the 800-pound gorilla

Gatsby is sort of the elephant in the room when it comes to JAMstack -- you can't mention one without the other, really.

That said: it's the framework I'm the least familiar with, yet it's the one I like the least.

Gatsby generates static sites with dynamic behavior thanks to React, hydrated via SSR payloads...that's where the parts I like come to an end. It really makes you do things the "Gatsby way" (it's very reminiscent of Rails, in that regard), at least in my experience, which is admittedly minimal (the only framework I'm really _super_ familiar with at this point is the last one on the list -- the rest, I've tried only briefly).

That said, a **lot** of people have found their ideal tool with Gatsby -- I initially was dead-set against it because it didn't support incremental content builds, but that's since changed. If you're building a dynamic site but want things to be as static as possible for the sake of speed, SEO, and so on (this _is_ the JAMstack), Gatsby might be the tool for you.

tl;dr It's worth checking out, just so you can say you have, and it _is_ popular for a reason. That said, it didn't suit my needs, personally.

## Hugo: like Jekyll, but in Javascript

The headline pretty much says it all -- [Hugo](https://gohugo.io/) is tailor-made for taking Markdown and turning it into static HTML. It's a static site generator, pretty much just like [Jekyll](https://jekyllrb.com/), and it works great! I'm actually using it to generate <austinpocus.com>, as of the date of this post at least.

Where Hugo shines is static content. Where it doesn't shine, so much, is as you might expect, the dynamic side of things. It's Jekyll but in JS, pretty much what it says on the tin.

tl;dr Great for static sites, not so much for modern web apps though.

## 11ty: the odd kid on the block

[11ty](https://www.11ty.dev/) is pretty freaking sweet, I think. It's a tool that's supposed to "just work" -- you feed in assets, and it processes them into a site. These assets can be `.11ty.js` templates, or React components, or Markdown files, or Pug for that matter. It can transform a _lot_ of different formats, and from all appearances, it seems to be very extensible and flexible.

That said, it appears to be meant more for use cases like Jekyll or Hugo, not so much like Gatsby or Next.js or what have you, which are geared more toward making modern web apps as static as possible.

Disclaimer: I'm using 11ty on my interactive fiction project, along with Netlify, and I've been enjoying the experience so far. It's almost as good as the next item on this list.

## Next.js: the best of the bunch for React apps

I'm a bit biased, since, at [Hacker Noon](https://hackernoon.com), we sort of flipped a 180 on our original infrastructure with [Next.js](https://nextjs.org/), and I have a soft spot for it.

That said, it's freaking brilliant and you should use it if you use React. Full stop.

Why though? What makes it so special? It's like this: it fills in a lot of gaps that React leaves behind as an exercise for the developer.

It does routing, it does script and meta tag insertion in a smart way -- hell, they even do _image optimization_ now with the `next/image` component. Not to mention, [Vercel](https://vercel.com) is probably going to be the next Heroku. No joke, those people are killing it when it comes to making a simple platform to deploy web software. Absolutely destroying the competition, in my mind.

That said, Next.js is a web app framework, not a static site generator, exactly. Yes, it does SSR and SSG and all that magical goodness...but it's made for web apps. I'm trying to build simple hypertext content, for the most part, right now. I'm blogging and writing interactive fiction -- it's not exactly a crazy UI that I'm building or a complex experience that you can't tackle with plain ol' HTML, CSS, and vanilla JS.

tl;dr Next.js is like the missing piece for React, although full disclosure, I use it at work and I'm already a big fan.

## The final word

Use 11ty or Hugo for static sites, Next.js for dynamic ones, unless you have a good reason to choose otherwise.

That's it. That's the post.
