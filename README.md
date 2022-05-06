[![Build status](https://github.com/pharo-ai/kNN/workflows/CI/badge.svg)](https://github.com/pharo-ai/kNN/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/kNN/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/kNN?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/kNN/master/LICENSE)

## Description

k nearest neighbours implementation in Pharo

## How to install it?

To install k nearest neighbours, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIkNN';
  repository: 'github://pharo-ai/k-nearest-neighbors/src';
  load.
```

## How to depend on it?

If you want to add a dependency on kNN to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIkNN'
  with: [ spec repository: 'github://pharo-ai/kNN/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

WiP
