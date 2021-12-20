---
title: "Designing Data for Games, Part 2"
date: 2021-12-20T16:41:25-05:00
tags: ["adventure-kit", "dev-journals", "love2d", "lua", "architecture"]
---

In [part 1 of this series][part1], I wrote about a data structure for dialogue trees. Here, I'd like to finalize that structure and discuss a data structure for RPG quests.

First, some quest music:

{{< youtube wf9Hh6pu78I >}}

I couldn't resist. I regret nothing!

Anyway, in the last post, I thought out a data structure for dialogue trees, and wrote out my thoughts as they came. I ended up with a relatively simple tree structure in a Lua table, where each entry is an option for what the player can "say" which contains responses. These options can lead to other options, and can include parameters for effects on the conversation.

Here, I'd like to think aloud about data for quests.

For those not familiar with role-playing games: a quest is like a "mission" in the Grand Theft Auto games, a goal of some kind. You're given something to do in the game, and if you fulfill that goal, you're given a reward or the story progresses in some way.

Often the state of the world will change if you complete a quest. For example, if you go to the past and steal the secret weapon from King Fuddlepants, he won't be able to use it if you challenge him in the future. That's a bit of a contrived example, but you get the idea.

Quests often involve common components, which I plan on using to design quests. For example, most people absolutely despise "escort" quests, where you help a non-player character (NPC) get to a destination, usually someone who can't help you in battle. The worst part about the NPC escort quests is usually the movement AI...but I digress.

Another common aspect of quests is items. You might be asked to retrieve the Legendary Sword of Power from the Bog of the Dead and return it to the Duke of Dingleberry.

Quests also involve choices in some games. You may choose not to give the sword to the Duke, instead keeping it for yourself, and he might send soliders after you to retrieve it.

Finally, quests have a reward of some kind. Either they give you an item, boost your stats, or progress the story in some way. Sometimes you get no reward, if the quest-giver is miserly.

This gives us a decent structure for quests. We can use the "quest components" or types, like `FetchItem`, `Escort`, `DefeatEnemy`, etc. to handle different quest types with common code. These components should lend themselves to combination. As in, you should be able to say "defeat this enemy, and escort the Village Elder back to the castle", making multipart quests.

So what will the data look like?

First, a quest should have a type, and a data field:

```lua
myQuest = {
  questType = Constants.QuestTypes.FETCH_ITEM,
  data = {
    item = Constants.ItemTypes.LEGENDARY_SWORD
  }
}
```

You can see here I'm referring to a seemingly global `Constants` variable, which should contain a lookup table of all the item and quest types in the game. It doesn't have to be global at all -- it can be imported as a module.

The purpose of the `questType` field is what you might expect, to make it easier to split up code between types. The value should be a bit field, so I'll be able to combine different quest types with ease using the bitwise OR operator (the pipe character, `|`, in Lua and most languages). This will also let me check the presence of a given quest type on a quest with bitwise AND (the ampersand, `&`).

The data field bothers me because it's sort of a catch-all object and it's badly named. Maybe it should be "details"? I'll have to think on this.

I'm starting to get further along in my thoughts than I'd like -- I need to embody some of these thoughts in code. I may write a "part 3" to this series, in the coming week, but for now I'm going to get "Escape from Valis" ready to open-source (I want to code in the open). Tune in next time!

[part1]: /posts/designing-data-for-games "Part 1 of this blog series"
