---
layout: post
title: Univariate k-means clustering
subtitle: Finding structure in your data
date: "2017-01-27"
tags: statistics data kmeans clustering
shinyembed: shiny-elbow-kmeans
---

Often data is distributed normally. But sometimes, there is sub-grouping in your data that is worth exploring a bit more: For example, a subset of your data is drawn from a different population, and therefore has a different mean.

One popular technique to find these clusters without any prior knowledge is k-means clustering. The idea is that you ask an algorithm to provide you with _k_ clusters, where k is an integer (between 1 and your sample size). The algorithm then selects some random cluster centers, and assigns each datapoint to the cluster it is closest to. It then calculates the within-group sum of squares (SS), a proxy for how much variance is in your data _after_ you account for the cluster centers.

The algorithm then moves around the cluster centers until this variance is minimised.

The tricky part comes when you need to decide how many clusters your data likely has. Of course, the more clusters you have, the more variance they account for, and subsequently the less variance is left after accounting for cluster centers. If you have the same number of clusters as you have data points, then each cluster just contains one point - and there is no variance left at the end. However, you've also not learned anything about your dataset.

One simple method is the "elbow" method, where you try out a certain number of clusters, and plot the within-group sum of squares against number of clusters. You then try and find the "elbow", or the point at which suddenly, increasing the number of clusters doesn't reduce the residual variance very much.

Since this is a visual procedure, it lends itself well to an interactive framework, so I've built one =) you can try it below, or find it [here](http://shiny.janfreyberg.com/shiny-elbow-kmeans). You can also see the backend code [here](http://www.github.com/janfreyberg/shiny-elbow-kmeans), although if you wanted to include a k-means algorithm in your data you probably don't want to use my code since for the purposes of making it interactive it's not the prettiest implementation.

I'll work on a bivariate version soon!

{::nomarkdown}
{% include inblog/shinyembed.html %}
{:/}
