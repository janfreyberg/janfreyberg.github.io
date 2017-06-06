---
layout: post
title: Visualising the bootstrap with shiny
subtitle: You can try out bootstrapping with my new shiny app.
date: "2017-05-27"
tags: shiny visualisation statistics teaching
shinyembed: bootstrap
shinystyle: "min-height: 870px;"
---

[Bootstrapping](https://en.wikipedia.org/wiki/Bootstrapping) is a really useful statistical tool. It relies on re-sampling, with replacement, from a sample of data you have acquired. The idea is that by re-sampling your sample over and over again, you simulate running studies over and over again. It's obviously not exactly analogous - sampling bias in your original sample will still affect your bootstrapped samples. But what's great is that you can re-calculate summary statistics, such as standard deviation, for each bootstrapped sample. And due to the [central limit theorem](https://en.wikipedia.org/wiki/Central_limit_theorem), these statistics will be normally distributed.

From this normal distribution of estimates, you can then calculate the variance and confidence intervals, of your summary statistic. This is commonly done for correlation coefficients: for any given sample, you can only calculate one correlation coefficient. But if you re-sample via the bootstrap, you can calculate potentially thousands of correlation coefficients of your _"new"_ samples, and the distribution of these correlation coefficients can inform you about the variation in your estimate of the correlation.

So far so good for the theory! There's obviously lots and lots more to think about when it comes to bootstrapping, and one of the key things is: __how many bootstraps should I run?__

To help illustrate how your distributions change with more and more samples, I created a `shiny` app that lets you try out different amounts of re-samples. It's embeded below, but you can also find it at [shiny.janfreyberg.com](http://shiny.janfreyberg.com)

{::nomarkdown}
{% include inblog/shinyembed.html %}
{:/}

You can find the source code for it [on github](http://github.com/janfreyberg/shiny-bootstrap). However, you probably do not want to copy the code from it for your own bootstrapping techniques. You could, but there are many R packages out there that make bootstrapping easy. I recommend trying out the [`tidyr` and `broom` packages](https://cran.r-project.org/web/packages/broom/vignettes/bootstrapping.html), as they help you get the results of your bootstrap into a tidy dataframe.
