---
title: "Deploying Hugo to S3"
date: 2020-12-12T21:47:03-05:00
---

Jeez Louise, what an ordeal. I mean, it's always a slog configuring any sort of cloud service, but I was sort of hoping AWS was different. I was both right and wrong.

I was right in the sense that they made it easy to get from step to step. I was wrong in the sense that there were still a ton of steps to get started.

First, I had to create a bucket. Initially, I thought I had to create a web endpoint in the bucket configuration, but I guess that's not how things are done these days.

These days, you have to create a CloudFront instance that points to the bucket. And you also have to provision a certificate for the custom domain, which may be managed using a third service, Route 53.

Then there's IAM. Oh, there's IAM...

IAM is like if the DMV was online. It's filling out forms in triplicate. It's bureaucracy incarnate. It's the bane of my existence, sometimes. But I managed to get a read policy on the S3 bucket, so that's nice. I guess.

It would be nicer if there were sane default templates I could choose from.

Overall, 5/10 not thrilled but not so frustrated I'd leave.

Oh, can you believe this is the first time I've deployed _anything_ on AWS in _years_? I mean, I've been using GCP for the past 2 years or so, and before that it was all Heroku and Github Pages, and custom private servers...things done changed.

Anyway, clouds suck and I look forward to the day we kick all this garbage to the curb in favor of happy little nodelets that can be deployed on demand to a global distributed network that has supplanted the web.

Hey, I can dream, right?
