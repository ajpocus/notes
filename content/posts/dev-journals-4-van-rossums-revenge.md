---
title: "Dev Journals 4: Van Rossum's Revenge"
date: 2021-07-20T14:21:26-04:00
tags: ["dev-journals", "adventure-kit", "python", "gamedev", "books"]
---

I know, I know, Van Rossum isn't the Benevolent Dictator for Life anymore. Still, gotta give him props.

This is a different sort of dev journal, since for most of yesterday and today, my dev time has been spent reading a book I'm thoroughly enjoying: [_Fluent Python_ by Luciano Ramalho](1).

This book is truly wonderful so far -- I'm sure I'll be writing about it more in the future. Right now I'm still processing the first chapter and the beginning of the second, namely the focus on builtins and how to integrate with functions like `len()` and `bytes()` and what have you.

It's pretty magical, when you think about it -- add a "dunder method", e.g. `__len__`, to your object and **boom**! Your object now works with a set of idiomatic Python constructs that make your code more readable, usable, and practical.

I'm especially looking forward to the `collections.abc` bit, the "abstract base class", that's been hinted at in the early parts of the book. I'm hoping that I can make useful constructs of my own, using this, but I may be misunderstanding the purpose of this module.

Overall, this isn't a book for Python newbies. I may be returning to Python after a long while, but I wouldn't consider myself "new to Python". Rather, we have some catching up to do.

That said, if you want to up your Python game, you couldn't do much better than this book, I think. It's friendly, but also rigorous and thorough. I truly believe any Python user who's trying to learn more advanced techniques will be quite happy with this book, and experienced Pythonistas will not be disappointed either.

I'm not being paid or anything to say any of this, by the way -- I truly believe that _Fluent Python_ is a great book for Python devs, and you should check it out!

From here, as I detailed in my last post, I have a pretty clear path forward. I'm just trying to improve my general Python skills and object oriented design (I got [the classic _Design Patterns_ book](2) as well, as part of my self-study).

If we're being honest, I probably got a few too many textbooks, as I recently discovered [abebooks.com](3), which is a great way to get books on the cheap from local bookstores around the country.

Again, not being paid here. Maybe I should be. But I just really like these books and whatnot that I'm linking to.

![Ron Swanson guaranteeing the quality of "Snake Juice"](/img/ron_swanson_guarantee.jpg)

_Ron Swanson's guarantee is worth its weight in secretly buried gold._

I bought several more books, is the point:

- [_Structure and Interpretation of Computer Programs_](4) by Abelson, Sussman, and Sussman
- [_Compilers: Principles, Techniques, and Tools_](5) by Aho, Lam, Sethi, and Ullman
- [_Engineering a Compiler_](6) by Cooper and Torczon

Among a few others, namely _Programming Windows_, by Charles Petzold, and _Accelerated C++_, by Koenig and Moo.

I went a little nuts with the used bookstore! Clearly. But I'll be talking more about the C++ and Windows books later -- for now, the goal is building up more fundamental CS knowledge and expertise in languages and environments other than Javascript and the web (which means Python, for the time being).

That said, I have to focus on the main goal: getting a proof-of-concept going for Adventure Kit. The todo list remains the same -- time to get back to it.

P.S. I just realized it's July 20! It's the 52-year anniversary of the moon landing! And with that, I leave you with some classic Bowie:

{{<youtube iYYRH4apXDo>}}

[1]: <https://www.oreilly.com/library/view/fluent-python/9781491946237/>
[2]: <https://www.oreilly.com/library/view/design-patterns-elements/0201633612/>
[3]: <https://www.abebooks.com/>
[4]: <https://mitpress.mit.edu/sites/default/files/sicp/index.html>
[5]: <https://suif.stanford.edu/dragonbook/>
[6]: <https://www.elsevier.com/books/engineering-a-compiler/cooper/978-0-12-088478-0>