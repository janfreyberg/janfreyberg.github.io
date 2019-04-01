---
layout: post
title: Why coverage doesn't cover pytorch backward calls.
subtitle: Some of the weird quirks of how pytorch modules and functions are called.
date: "2019-04-01"
tags: pytorch, testing
comments: true
---

Having recently switched to using pytorch for modeling, after primarily building
neural networks in tensorflow / keras, I have been enjoying how easy it is to
write new (automatically differentiable) functions and layers.

I did this recently: I wanted to create a layer that would reverse gradients
during a backward pass. There are many reasons you might want to do that, one of
which is to make parts of your network learn the _opposite_ of what it would
learn from minimising the loss.

The result is [here](https://github.com/janfreyberg/pytorch-revgrad), but most
of the logic is embedded below.

As you can see, the main object to use is a "layer", also known as a module in
pytorch. A module can be a single layer (e.g. `torch.nn.Linear`), or a whole
network, and the fact that they are fundamentally the same object makes it easy
to construct complex networks out of existing, complex building blocks.

However, implementing a custom `torch.nn.Module` does not allow you to define
your own auto-differentiation functions. Since I wanted to manipulate the
gradients during the backward pass, I had to do this.

`torch.autograd.Function` objects implement both a forward and backward method,
and they behave as you expect: the forward method receives the input and returns
the output, while the backward method receives the gradient of the output and
returns the gradient of the inputs.

When it came to test this code, I wrote just one test for the `Module`. Since
this does nothing except call the function, I figured all my code would be
covered.

But - figuring that code is covered by tests is good, but knowing is better. So
I checked this with _coverage.py_, a module that tells you which lines of code
were run during a particular session and which were not.

And while the tests passed, the coverage indicated that the backward call never
happened!

![coverage of torch custom function](/img/torch-coverage.png)

So it seems like the function did what it was supposed to - reversed the
gradients - but did not get called. However, after some puzzling and some help
on the [pytorch forums](https://discuss.pytorch.org/t/custom-autograd-function-backward-pass-not-called/9144/12?u=janfreyberg),
I realised that the way _coverage.py_ tests if a line ran (using a _trace_,
which is a function that gets run after every line of python code) does not in
fact work for the backward method.

It's called by C++ code, not python code, and so coverage doesn't know that it
was called.

So: when testing for coverage in custom pytorch functions, exclude the backward
passes.

### Code

<script src="https://gist.github.com/janfreyberg/9d7c47a4c59b8733b9af779718738849.js"></script>
