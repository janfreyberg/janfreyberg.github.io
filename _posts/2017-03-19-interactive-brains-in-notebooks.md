---
layout: post
title: Interactive Brain Visualisations in Notebooks
subtitle: Letting readers explore your data
date: "2017-01-27"
tags: jupyter interactive
---

One of the things I think about a lot these days is interactive data. I believe that when you're presenting research or analyses to a data-literate crowd, it's best to allow people to interact with your data. This means readers can explore the data themselves, and if you did your analysis well, then providing interaction with the data will let the reader convince themselves of that fact. It makes your arguments more compelling.

One particular case in which I believe that's true is in scientific papers. It's good to write your papers in a way that a non-expert from another sub-discipline can understand them. But you also want the experts to come away thinking, _"That's a good analysis"_.

Luckily for researchers, there have been some very exciting developments in interactive data exploration recently. We now have a framework for combining rich text (your writing) with code (your methods) and interactive visualisations (your data): Jupyter notebooks[^1].

When I went to the Cambridge branch of Brainhack Global recently, I was working on some MRI analyses in a jupyter notebook. Working the same project, Bjoern Soergel came up with the idea to implement inline interactive brain visualisations. In its most simple form, it would be a way to look at the content of a NIfTI file and slice it at different points to see what's in the file.

So we coded up a new package: [NiWidgets](https://github.com/janfreyberg/niwidgets). The package provides a simple way to make a variety of plots interactive, including a simple slicer much like `fslview`. All the user needs to do is provide the path to a nifti file.

More usefully, you can also make custom plotting functions interactive. For example, the glass brain function from `nilearn` can be made interactive by allowing the user to threshold the statistical map at different levels, and letting the user pick a color map.

You can try the package out by cloning the repository from github, and you can take a look at the example implementation here:
https://github.com/janfreyberg/niwidgets/blob/master/visualisation_wrapper.ipynb


#### Footnotes

[^1]: Jupyter is a language agnostic framework in which your code is inside cells, and all output is stored inline. It supports many programming languages, including Matlab, Python and R.
