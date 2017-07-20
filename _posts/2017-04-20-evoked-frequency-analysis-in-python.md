---
layout: post
title: Analysing SSVEPs and other evoked frequencies in python
subtitle: A new package that builds on MNE-python and makes analysing evoked frequencies easy.
date: "2017-05-20"
tags: eeg python ssvep
comments: true
---

I frequently work with evoked frequencies. This involves stimulating your subjects at a certain frequency (say, by flickering a light at a 10 Hz), and simultaneously recording brain activity. Usually, this recording is done with EEG or MEG data, since it gives you enough temporal resolution to pick up a wide range of frequencies. When you then analyse the frequencies in the recorded data, you can usually very distinctly pick up the frequency at which you stimulated.

What's very useful about this technique is the fact that the amplitude of the evoked frequency in the MEG/EEG spectrum often corresponds in some fashion to the degree to the strength of the stimulus, and the degree to which it is processed in the brain.

So, for example, if I flicker a dim light at 15Hz, and later flicker a bright light at 15Hz, the amplitude of the 15Hz oscillation will be higher in the EEG spectrum from the second recording. Similar analysis is possible with sounds, touch, and even temperature sensation.

This is a simple example, but there are many extremely interesting things you can do with it - from probing the degree to which faces are processed by infants ([Heering and Rossion, 2015](http://elifesciences.org/content/4/e06564)), to the degree to which top-down signals interact with low-level perception ([Gordon et al, 2017](https://elifesciences.org/articles/22749#fig3s1)).

I wanted to streamline my own evoked frequency analysis, and provide a good way for anybody to use the same analysis. Since I do my data analysis in python, and really the only player in python town when it comes to M/EEG analysis is MNE-python, I built an object-oriented framework that extends MNE data structures, and automatically evaluates all kinds of parameters of interest to someone doing evoked frequency analysis.

![](http://www.janfreyberg.com/ssvepy/_images/example_17_0.png)
_An example of a plot that takes about 3 lines of python code with ssvepy._

This way, you can do your data processing in MNE (re-referencing, de-noising, epoching, etc.) and then simply pass your data to `ssvepy`. You don't ever have to deal with the actual numpy arrays containing the data, in the way you do when you do time / frequency analysis in MNE itself.

The package also takes care of a couple of important things for you when it comes to evoked frequencies. For example, it calculates harmonic and subharmonic frequencies for you. It also calculates intermodulation frequencies for you if you specifiy more than one stimulation frequency. I think this is particularly useful, since it's quite a lot of hassle calculating these yourself. And of course, for each of these "special" frequencies, it automatically evaluates the amplitude, signal-to-noise ratio, and scalp distribution for you.

Try it out! Simply install it from pypi via `pip install ssvepy`, or from [github](https://github.com/janfreyberg/ssvepy). The documentation and an example notebook are at http://www.janfreyberg.com/ssvepy

And if you find you're running into trouble, please do open an issue on github, or contact me on [twitter](http://twitter.com/janfreyberg).
