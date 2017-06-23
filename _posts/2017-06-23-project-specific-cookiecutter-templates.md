---
layout: post
title: Project-specific cookiecutter templates for reproducible work
subtitle: Making it easier for others to use data sets by providing standardised ways of getting the data and loading the data with cookiecutter.
date: "2017-06-23"
tags:
---

I recently read a really good blogpost by Enrico Glerean titled [Project management == Data management](https://eglerean.wordpress.com/2017/05/24/project-management-data-management/). In it, he explains best practices for managing data, and standardising project file structures and layouts. One of the tools he mentioned was `cookiecutter`, a tool with which a template github repository can be cloned, with specific variables and file/folder names in the template being replaced by questions `cookiecutter` asks you during setup.

I think this is a great way to go about it, but wonder if this can be improved even further for the specific use case of researchers working on the same datasets. Those researchers will usually want to download the same data from some webserver, or if it's already accessible somewhere on the campus network or local computer, to load the data into their analysis scripts.

I experienced this when I recently tried to play around with the [_Child Mind Institute's Healthy Brain Dataset_](http://fcon_1000.projects.nitrc.org/indi/cmi_healthy_brain_network/index.html). I plan to do some analysis on this data and I know some friends who plan to do the same.

### Cookiecutter template for a specific dataset

So I figured it would make a lot of sense to make downloading and then using the data simple for everyone who wants to work on it. I wrote a [cookiecutter template specific for this dataset](https://github.com/janfreyberg/cookiecutter-healthy-brain) that you can copy very easily by typing at the command line:

```
cookiecutter https://github.com/janfreyberg/cookiecutter-healthy-brain
```

It will ask you for the "slug" (or folder / repository name) you want to use, and where you would like to store your data. It then provides functions to download the CMI Healthy Brain data from their amazon S3 bucket (for example, simply `import data.download.download_sample_eeg` and run the function to download a random sample of EEG datasets), and to load that data (`from data.eeg.preprocessed.resting_state import epochs`).

![](_posts/img/importing-data.png)

This means you can use the data with simple and efficient code in your analysis. An example of how you might want to go about it is given [in an example notebook](https://github.com/janfreyberg/cookiecutter-healthy-brain/blob/master/%7B%7Bcookiecutter.project_slug%7D%7D/00.02-use-eeg-data.ipynb).

### So what's the benefit of this?

I think it has three main benefits for anyone wanting to use the data:

1. The way the data is loaded is __standardised__. There are idiosyncrasies in every project dataset, and loading data often requires combining information spread across multiple files and the knowledge on how they are combined. When you're unfamiliar with the data you might make mistakes. This hopefully avoids that.

2. It __saves time__. Making a simple way to import the data avoids everyone having to re-do the same initial steps when loading the data.

3. You get __neater syntax__. By providing functions that output the data pre-loaded, in python loading data becomes a very clear `import` statement in your file.

Now, obviously there are some problems with it as well. One obvious one is the choice of tools: The way I have implemented the EEG data loading at the moment only has benefits if you're using python, and more specifically if you're using `MNE-python` - and I don't plan on implementing it for any other tools.

Another problem is the propagation errors: If I make a small mistake in the loading code and others re-use it, there might be lots of bugs all over the place. However, if someone with knowledge of the project implements the code, this shouldn't be a big issue.

I think in the long run, releasing something like this can increase the usage for public datasets, but it will likely always be limited by whatever tools and libraries the creators want to focus on.
