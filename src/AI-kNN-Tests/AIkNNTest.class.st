Class {
	#name : #AIkNNTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'AI-kNN-Tests'
}

{ #category : #'as yet unclassified' }
AIkNNTest >> setUp [
	model := AIkNN new.
	model k: 3.
	{ 10@1. 11@2. 9@3. 8@4. } do: [ :p | model add: p label: 1 ].
	{ -10@1. -11@2. -9@3. } do: [ :p | model add: p label: 0 ].
]

{ #category : #'as yet unclassified' }
AIkNNTest >> testClassify [
	self assert: ( model classify: 6@0 ) equals: 1.
	self assert: ( model classify: -6@0 ) equals: 0.
]

{ #category : #'as yet unclassified' }
AIkNNTest >> testNeighbors [
	self assert: ( ( model neighborsOf: 10@0 ) allSatisfy: [ :p | p label = 1 ] ).
	self assert: ( ( model neighborsOf: -10@0 ) allSatisfy: [ :p | p label = 0 ] ).
]

{ #category : #'as yet unclassified' }
AIkNNTest >> testTooFewNeghbors [
	model k: 100.
	self assert: ( model classify: 6@0 ) equals: 1.
	self assert: ( model classify: -6@0 ) equals: 0.
]
