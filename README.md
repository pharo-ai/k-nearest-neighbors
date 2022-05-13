[![Build status](https://github.com/pharo-ai/k-nearest-neighbors/workflows/CI/badge.svg)](https://github.com/pharo-ai/k-nearest-neighbors/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/k-nearest-neighbors/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/k-nearest-neighbors?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/k-nearest-neighbors/master/LICENSE)

## Description

k Nearest Neighbors implementation in Pharo.

More information on the pharo-ai wiki page: https://github.com/pharo-ai/wiki/blob/master/wiki/MachineLearning/k-nearest-neighbors.md

## How to install it?

To install k nearest neighbours, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIKNearestNeighbors';
  repository: 'github://pharo-ai/k-nearest-neighbors/src';
  load.
```

## How to depend on it?

If you want to add a dependency on kNN to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIKNearestNeighbors'
  with: [ spec repository: 'github://pharo-ai/k-nearest-neighbors/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.
