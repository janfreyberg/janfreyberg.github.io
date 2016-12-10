---
layout: post
title: Building this website
subtitle: A huge amount of customization with jekyll & bootstrap
tags: website backend
---

I could really like web development. I've created two websites, this one, and one for a charity I used to volunteer for, [Education Partnerships Africa](http://www.epafrica.org.uk/). The website for EPAfrica was primarily built by others, but I was involved in some of the detail work. It's built with wordpress, which is great: it can be a simple drag/drop, but it can also change almost every detail. But I always found it really fiddly too, and it takes a long time to do small changes.

There are many reasons I wanted to build my personal website without a managed platform like wordpress. One, I like understanding anything I'm working on. Two, I want my page to be lightweight, and wordpress is anything but. Three, I usually code in [Atom](http://www.atom.io), and really like writing in it - it's what I'm writing this blogpost in right now. And four, I want to have a good place to host the website[^1].

So I turned to github pages, which I had seen other scientists use for their website. I didn't really know how it worked, but since it's based on github, it would also have excellent version control. You can just upload your own fully written HTML to it, but that would make it very hard to blog with it. But it turns out it uses Jekyll, which is a nifty framework that puts together your website for you and uses variables to e.g. present your most recent blogposts on the front page (see [here](/)). When you put a new blogpost - which is completely written in markdown - in your posts folder, jekyll will find it, get its title and content, and display it on the [front page](/), the [blog index](/blog/), or even a [tags page](/tags/).

I can highly recommend jekyll, since it applies much of the same logic that you use in regular scientific computing, but uses it for websites and blogging. Some of the introductions that helped me a lot are [this guide to getting started](http://jmcglone.com/guides/github-pages/), and [this template](https://github.com/volny/stylish-portfolio-jekyll). In particular, the template I used also uses bootstrap, which is a framework developed by twitter for laying out your website. It's great.

I also really wanted to make R shiny visualisations a part of this blog, since I've been using it in teaching recently and like it for illustrating statistical concepts. So in addition to the website itself being hosted on github pages, I started an [amazon web services free-tier computing instance](https://aws.amazon.com/free/). This is essentially a linux computer in the cloud. I installed git, R, and shiny server on it, and I was good to go[^2]. Simply cloning the [github repository](https://www.github.com/janfreyberg/factorial-anova/) of one of my shiny visualisations will make it available at [shiny.janfreyberg.com](https://shiny.janfreyberg.com/factorial-anova/). I can then embed these in blogposts, such as [this one]({{site.baseurl}}/2016/11/16/visualising-a-2x2-anova/).

Having my own shiny server also means I will be able to host R-markdown documents such as presentations on it. I don't have any of those yet - but I will eventually...

#### Footnotes

[^1]: I don't mind paying for hosting space, but I get so little traffic that I wanted to go free for now. Github pages seems like a good place to do that.

[^2]: This is a slight exaggeration, it actually took a some fiddling to get all the R packages I needed installed

PS: All pictures on this website are either taken by me or from the mailing list [Death To Stock Photo](http://deathtothestockphoto.com/) mailing list.
