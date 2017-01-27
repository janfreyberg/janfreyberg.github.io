---
layout: posts
title: Predicting unreportable perception
subtitle: Sometimes we can't report everything. For those times, we have EEG
date: "2016-12-22"
tags: eeg machinelearning vision
---

We have two eyes, but we perceive one "visual world". In most cases, our eyes merge the input from the two eyes, often after extracting useful information from the separate information streams (for example, depth cues). This means we don't know what eye a particular piece of "visual information" is coming from (unless we do things like close one eye). In most situations this would be trivial anyways, since the two eyes see the same things.

Our inability to distinguish this can be tested experimentally by presenting a "target" to one eye only, using something like a mirror stereoscope or newer devices such as VR headset, and asking people to report which eye they are seeing the target with. They fail.

But we also know that very early in the visual system (V1 - where most signal from the eyes comes in after passing through the thalamus) many neurons are primarily driven by one eye. So at least in theory, the brain has the information to determine what eye information is coming from, and yet it does not. But could neuroscience?

To test this, a [](recent paper) used neuroimaging data to try and guess which eye is seeing an image based on activity patterns in the visual system. The paper used multivariate pattern analysis, a technique relying on machine learning, to train an algorithm to distinguish between left eye and right eye stimulation based on EEG data from X electrodes.

The algorithm achieved ~65% accuracy at guessing which eye an image came from based on the EEG data - which is not astounding, but better than what humans achieve (50%, or random guessing):

In tasks in which humans perform better - say, determining whether lines are tilted upwards or downwards - the algorithm also performs much better. And interestingly,  eye-of-origin decoding occurs later than it does for these other tasks.
