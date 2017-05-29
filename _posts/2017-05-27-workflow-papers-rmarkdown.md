---
layout: posts
title: A workflow for writing papers in Rmarkdown
subtitle: Writing papers in Rmarkdown is easy when integrated with Zotero and the Knit-to-Word function.
date: "2017-05-27"
tags: r zotero
---

[Rmarkdown](http://rmarkdown.rstudio.org) is a syntax for writing plain text documents that get converted to rich text webpages, pdfs, word documents and presentations. At its basic level, it follows the ideas behind all plain-to-rich text converters: that writing without having to focus on the layout of the document makes it easier to concentrate on what you want to convey, not how you are going to convey it.

One of the great things about Rmarkdown is that you can integrate R-code in your manuscript. Say you're writing a scientific paper with a few plots in it. You can write the paper, and at the position where you want to include the plot, you include the R-code that produces your plot, instead. This is often called a way to make "reproducible" reports: maybe you write the pre-ample for a monthly summary of data collected by your team once, and every month you just re-compile the Rmarkdown code and get an up to date report of the monthly results.

However, it has benefits even when writing a "one-time" [^1] document such as a paper. When you need to change a plot - maybe [from a bar graph to a violin plot](http://thenode.biologists.com/barbarplots/photo/) at the behest of a reviewer - you just need to change the R-code that produces the plot. For comparison, in an editor like word, you would have had to change the code, then save the plot to file, then insert the file into word and delete the old one.

But writing in editors such as Word brings its own benefits: mainly, track changes and comments from collaborators, and integration with reference managers. I just wanted to outline a workflow that has worked for me in the past.

### Easily add citations to your document

For references, I use the package [citr](https://github.com/crsh/citr) alongside [Zotero](http://zotero.org) and the zotero plugin [Better BibTeX](https://github.com/retorquere/zotero-better-bibtex). You need to export your Zotero library to a `.bib` file that you keep synchronised to your library. Then, you add `bibliography: /Users/jan/Documents/Zotero/better-bibtex/zotero-library.bib` to the YAML pre-amble of your Rmarkdown document. Then, if you install the `citr` package, you can simply click the add-in menu and insert a citation:

![](https://github.com/crsh/citr/raw/master/tools/images/addin_demo.gif)

Of course, you can also configure a short-cut for it. I have it mapped to `Cmd + R`. When knitting (ie compiling) your document to PDF, it will feature the correct references in place, and the correct bibliography at the end.

So you've written and properly referenced your paper. But what if you want to get input from your collaborators?

### How to get comments from collaborators stuck in the past

There is an extremely simple solution to this: knit to word. Thanks to pandoc, a universal document converter, RStudio can turn your Rmarkdown document into Word documents as well as PDFs. At the top of the editor window, click the knit drop down and choose "__Knit to word__". Send the document to your collaborator, and they have your most up-to-date figures and references to comment on.

Now, the fiddly part comes when you update your document. You need to copy over any changes in the word document to your Rmarkdown document. I personally don't mind doing this manually: the added friction in moving changes from one document to another allows me to think about the changes more, rather than simply clicking the _Accept_ button in Word. But this will always be up to individual preference!

### Footnotes

[^1]: And let's face it, you really write a paper lots and lots of times.
