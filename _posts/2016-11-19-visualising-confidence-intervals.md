---
layout: post
title: Visualising Confidence Intervals
subtitle: Clearing up a misconception with confidence intervals
date: 2016-11-19
tags: visualisation statistics teaching
shinyembed: confidence-intervals
shinystyle: "min-height: 850px;"
comments: true
---

Confidence intervals are a nice way to present your results. They get you away from the dichotomous nature of _p_-values, and allow you to express the precision of the variable of interest. Whether it is the difference between two groups in a t-test or the slope of a linear regression, it helps the reader in understanding your data if you tell them how precisely you can estimate the data.

There is a common misconception, however, about confidence intervals: that they allow you to predict the range in which the true value falls with a certain probability. The idea that e.g. a 95% confidence interval of an average implies that there is a 95% chance that the true population average falls inside the interval is false.

This is because once you've completed a study, the confidence interval either includes the true value or not, so it's not helpful to think it as a predictor of the possible range of values for the true mean. The confidence value actually refers to the fact that if you ran the same study many many times over, in e.g. 95% of cases the confidence interval would include the true mean.

Instead, confidence intervals allow you to think about the precision of your estimates. So if you estimate the difference between two groups to be 0.5 (of an arbitrary measure), and your 95% confidence interval ranges from 0.05 to 0.95, you're data isn't providing you with a particularly precise estimate, and even though you may have a statistically significant result ar your chosen alpha level, you may want to consider replicating your study in a bigger sample, or with less measurement error.

I have written a visualisation to demonstrate this idea. It simulates a study many many times over, and plots the resulting confidence interval (in this case a simple group difference) in the top plot. As you run it many times over, it accumulates a histogram of how often a value was inside the confidence interval. You will see that the true mean falls inside the confidence interval 95% of the time (or 99% if that is where you set your confidence level).

But you'll also see that large confidence intervals result in a much larger range of values, and that reducing your confidence interval through increasing sample size means that values inside your confidence intervals are much less frequently far away from the true mean.

{::nomarkdown}
{% include inblog/shinyembed.html %}
{:/}

The code for this visualisation is available [here](https://www.github.com/janfreyberg/confidence-interval-simulation/), and you can view it below, or on a separate page [here](https://shiny.janfreyberg.com/confidence-intervals/). If you have any thoughts on improving the visualisation (much of which I gleamed from others' online, but which I didn't see anywhere in the way I wanted it), send me a tweet or open a Github issue.
