---
title: "Lua as Data"
date: 2021-12-17T15:02:09-05:00
tags: ["adventure-kit", "dev-journals", "gamedev", "lua", "love2d", "react"]
---

I want to put a bunch of quest and dialogue data in the game I'm working on, ["Escape from Valis"][lastpost], but I don't want to write it by hand. What if I could write a Lua data structure using a web app?

## The problem

I'm designing a game, "Escape from Valis", and as an old-school RPG, it'll naturally include quests and dialogue. This would have to live in some sort of data structure...so how would I put this data in the system without writing it all myself?

## A potential solution

The solution that comes to mind would be to write to a data structure using some application, which would have some sort of configuration interface, right? But, there's a catch.

Lua isn't the best language for full-on application development. Sure, I could build an entire GUI in Lua with some of the libraries out there, but it's needlessly difficult.

What if, instead, I could write a Lua data structure in a language better suited to app development? What if I used my Javascript skills, along with some sort of Lua translation tool, to create a data structure in a web app and write it to a `.lua` file, much like [Tiled][tiled] does?

## The plan

This is entirely possible -- Lua lends itself well to data expression. The "table" data structure, Lua's only compound type, acts as a list, a dictionary, or an object (using "metatables"), all in one neat package.

The format is actually quite similar to JSON, and I discovered through a bit of experimentation I don't even need a [Javascript-based Lua VM][luavm]! I wrote a simple regex or three that replace key characters in the `JSON.stringify` output, namely the ":" character and the square array brackets, like this:

```javascript
JSON.stringify(luaData, false, 2)
      .replace(/"(\w+)":/g, "$1 =")
      .replace(/\[/g, "{")
      .replace(/\]/g, "}");
```

If you're not up on your regexes, the first one simply captures the value in double quotes, and unquotes it, replacing the ":" with a "=". The other two replace the square brackets. Just like that, we have valid Lua!

From there, you can write the contents to a file and trigger a download:

```javascript
// Code modified from https://stackoverflow.com/questions/13405129/javascript-create-and-save-file
// Licensed under CC-BY-SA 4.0
// where luaState is an object
const fileContents = JSON.stringify(luaState, false, 2)
  .replace(/"(\w+)":/g, "$1 =") // replace quoted properties with bare identifiers and an equals sign
  .replace(/\[/g, "{") // replace square brackets in these two regexes
  .replace(/\]/g, "}");
const file = new Blob([fileContents], { type: "text/plain" }); // create a file object
const filename = "quests.lua";

if (window.navigator.msSaveOrOpenBlob) { // IE10+
  window.navigator.msSaveOrOpenBlob(file, filename);
} else { // Others
  let a = document.createElement("a"); // creating a virtual "link" to download
  const url = URL.createObjectURL(file);
  a.href = url;
  a.download = filename; // this is what sets up the actual file download
  document.body.appendChild(a);
  a.click(); // trigger the download

  setTimeout(() => {
    document.body.removeChild(a);
    window.URL.revokeObjectURL(url);  
  }, 0); // setTimeout(..., 0) will run on the next tick, ensuring the download runs
}
```

From here, I'll probably have to cover some edge cases. Now that I look at the code, `null` and `undefined` would have to become `nil` to be valid Lua (but that's not a problem in this case). Next, I have to create a dead simple UI using React and Next.js, my weapons of choice. This UI should let me add primitive values to compound objects, nested if I choose.

I need to design a data structure first, though. My next post will most likely cover this in detail.

[lastpost]: /posts/i-wanna-know-what-love-is "My previous post about love2d, Lua, and game development"
[tiled]: https://www.mapeditor.org/ "The Tiled map editor homepage"
[luavm]: https://fengari.io/ "lua.vm.js, the Lua virtual machine written and executed in the browser"
