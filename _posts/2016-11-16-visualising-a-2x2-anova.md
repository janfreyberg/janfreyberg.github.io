---
layout: post
title: Visualising a 2x2 ANOVA
subtitle: One way to make clear what is being calculated in a two-way ANOVA
date: "2016-11-16"
tags: visualisation statistics teaching
shinyembed: factorial-anova
comments: true
---

The factorial design ANOVA (or Analysis of Variance) is maybe one of simplest yet most used tools in psychological research. It's a test of mean differences between groups, but it tests for those mean differences using a "Variance explained" approach.

If we assign incoming participants to one of 2 levels (level "a" or level "b") in two factors (factors 1 and 2) each, we end up with four groups[^1]. Let's assume these four groups are our only way of understanding this data, so we didn't ask participants for age, sex, or anything else (or at least, we don't want to use these metrics in our model). This means that the best model we can construct to explain this data is a model of group differences: for a participant in level *"a"* in factor 1 and level *"b"* in factor 2, the best prediction we have for this participant's dependent variable is the average of all participants in his or her group (the *Factor 1: a / Factor 2: b* group).

An ANOVA performs an analysis of the variance in the data, and how well the group differences explain these results. To do so, you calculate the variation explained by our various factors, and compare it with the total variation in our sample. The metric of variation is the sum of squares, or SS - subtracting all values from the mean value and adding the square of them[^2]. We can then compare the amount of variation explained by our factors, and our model as a whole, with the *residual* amount of variance, or *error*. This is simply the variation within each group, so the sum of the square of the differences between each point and its group mean.

This calculation can sometimes be tricky to understand, as to do an ANOVA, you (or your statistical programs) need to calculate many different sums of squares, and it's not always obvious what these are. To make it a bit clearer, I wrote the [following visualisation](https://shiny.janfreyberg.com/factorial-anova) - it lets you look at a very simple 2x2 factorial design dataset, with 4 subjects in each group. You can first add the three effects that can be present in a 2x2 ANOVA (main effect 1, main effect 2, and interaction), and then choose to visualise which sum of squares gets shown.

The code for this visualisation is [available on github](https://www.github.com/janfreyberg/factorial-anova).

{::nomarkdown}
{% include inblog/shinyembed.html %}
{:/}

#### Footnotes

[^1]: As an example, think of a drug study where we have 2 drugs - say paracetamol and aspirin - and we assign people to a level in each of these *factors* - say placebo and standard dose. This yields 4 groups: A placebo/placebo group, a placebo/paracetamol group, an aspirin/placebo group, and an aspirin/paracetamol group.

[^2]: Note that *variation* is different from *variance*: variation is calculated as the sum of the squared differences. To obtain the variance of a dataset, you calculate the average variation - dividing the sum of the squared differences by the number of data points.
