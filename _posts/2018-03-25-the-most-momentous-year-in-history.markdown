---
layout: post
title: "The most momentous year in history?"
subtitle: "Scraping wikipedia to investigate historical density (Part 1)."

date: "2018-03-25 21:21:52 +0100"
---

I really like history, and one of the things I sometimes spend my time doing is reading historical articles on [Wikipedia](https://www.wikipedia.org/). The other day, this got me thinking about whether the amount of historical fact on wikipedia can be analysed in any interesting way.

So I gave it a shot this week - I scraped the articles on particular years. Wikipedia in fact has an article on every single since 1 AD, as well many articles for years before that.

Each of these articles lists "Events", "Births", and "Deaths". Most of the time, these are listed in a very regular, structured way, so it was fairly easy to scrape them.

What I mainly wanted to see is if the number of events listed for a year on Wikipedia indicate something about that year.

Once you do the scraping, this is the number of events listed for a each year between 1 and 2018:

{::nomarkdown}
{% assign chart_name = "timeline-linear-scale" %}
{% include charts/historical-density/timeline-linear-scale.html %}
{:/}

There are a few zeros in there, and that is partially because we apparently know nothing about some years (notably, [149 AD](https://en.wikipedia.org/wiki/149) seems to have been boring), and partly because some articles don't follow the standard layout and format, which meant the scraping didn't work.

The other thing that's immediately obvious is that the data is biased towards recent history. In particular, starting in the late 18th century, we see a big increase in the number of recorded events. This coincides with what is often called the "Late modern period", starting with the French revolution. There's no surprise that we have more extensive records for recent periods, but I do find it fascinating that there is such a clear shift in the number of recorded events.

Because of the big increase during this period, I wanted to see if plotting the data on a log scale would make a difference:

{::nomarkdown}
{% assign chart_name = "timeline_log_scale" %}
{% include charts/historical-density/timeline-log-scale.html %}
{:/}

We see a few things - first, that the data is noisy, and second, that there is a trend towards more recorded events, even before the late modern period begins.

However, what I really wanted to see is whether we can actually see momentous years in history in this data. Given the trends, I wanted some way to "normalise" the number of records for a year relative to the records for that age, so I took the data from the surrounding 50 years and used that data to Z-score the number of recorded events. This leads to the following result (I've highlighted some of the highest-scoring years):

{::nomarkdown}
{% assign chart_name = "z-score-scatter" %}
{% include charts/historical-density/z-score-scatter.html %}
{:/}

A few things are immediately obvious. First, the beginning of a century scores highly. This might be because of "approximate date" events, which are ascribed to e.g. [the year 600](https://en.wikipedia.org/wiki/600). That's not necessarily accurate, and biases the data.

Second, years that are undoubtedly momentous, such as 1945, stand out.

But third - there are some weird years that stand out for seemingly random reasons. [1597](https://en.wikipedia.org/wiki/1597), a year in which big events such as the [Battle of Chilcheollyang](https://en.wikipedia.org/wiki/Battle_of_Chilcheollyang) happened - but there are also 15 separate mentions of a man called [Tycho Brahe](https://en.wikipedia.org/wiki/Tycho_Brahe). While Tycho seems interesting, I don't think a minute log of the events in his life are necessary.

This leaves me with the sense that this data is relatively biased by the whims of wikipedia editors. A fan of Tycho Brahe can easily push a relatively uneventful year like 1597 to be above its peers.

One way in which I would like to try and get around this problem is by looking at the articles linked in the Events for a particular year, and counting the total number of characters in that article. I feel like that may more heavily weight years in which events with wider ramifications occurred, as those are more likely to be long articles.

There's no guarantee this works - a Tycho Brahe fan may easily write an article on him longer than the article on World War II - but I'll give it a shot in Part 2 of this series (stay tuned).

### Code

The code I used for this project:

{::nomarkdown}
<script src="https://gist.github.com/janfreyberg/1f5765d544f987670c297ab024d86ea8.js"></script>
{:/}
