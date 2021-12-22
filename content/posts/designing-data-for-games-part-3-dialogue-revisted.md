---
title: "Designing Data For Games, Part 3: Dialogue Revisted"
date: 2021-12-22T15:35:45-05:00
tags: ["adventure-kit", "dev-journals", "gamedev", "lua", "love2d", "react", "typescript"]
---

I'm building out [the `make-conversation` project][1] to create dialogue trees for "Escape from Valis", generating a Lua data structure from a Javascript object. Here, I'd like to get into the details of dialogue trees and what I've run into so far.

Last time, I came up with a data structure like this:

```lua
elderDialogue = {
  start = {
    optionText = "Hi, I'm Foo, Mr. Elder.",
    response = "My father was Mr. Elder. You can call me sir.",
    options = {
      polite = {
        optionText = "Of course sir. Do you know where the secret cave is?",
        response = { -- response can be a table as well as a simple string
          text = "You're a nice kid, here's the map. Not much of a secret, really.",
          item = "thisIsAnItemId" -- this should refer to a canonical item table
        },
        options = {
          sayThanks = {
            optionText = "Thank you!",
            response = "You are very welcome, friendly stranger.",
            ending = true -- this option will end the conversation with this NPC
          },
          walkAway = {
            optionText = "[Walk away]",
            ending = true -- if you walk away there shouldn't be a response
          }
        }
      },
      rude = {
        optionText = "I could, but I'll call you Slappy!",
        response = "Well, you won't get anything from me! Go away.",
        ending = true
      }
    }
  }
}
```

This data structure, as I noted last time, is a bit repetitive, needs data encapsulation (when there's an item), and so on.

The biggest issue is the nesting. I'd like to define types, using Typescript -- here I'll use a pseudo-Typescript style so I don't have to refer to a manual while I write.

So what exactly is a `DialogueTree`?

A `DialogueTree` should have an NPC identifier as the key, and an `Options` object as the value.

An NPC identifier will just be a slugified string, most likely the NPC name with hyphens in place of spaces, and the special characters escaped.

What is an `Options` object? Well, it might look like this:

```typescript
interface dialogueTree = {
  [NPC_ID]: {
    [optionId]: {
      text: string,
      response: Response
    },
    [otherOptionId]: {
      text: string,
      response: Response
    }
  }
}
```

What is a `Response` exactly? Maybe this:

```typescript
interface response = {
  responseType: ResponseType,
  text: string,
  data: any,
  options?: Options
}
```

Here we have a recursive data structure (which is what I'd expect). React is conducive to recursive structures, sort of. So far, I have code that uses a `keys` property in the React component to track how to get down to that particular option from the root state object (the `DialogueTree` type we defined).

What is a `ResponseType`? That will be defined as an enum of sorts, a union of types in Typescript, that will declare constants that can be used to process the response object in the Lua code.

From here, I think I have a better idea of where I'm headed. I'm going to start by converting my current code to Typescript, and start defining these types formally. Back to it!

[1]: https://github.com/ajpocus/make-conversation
