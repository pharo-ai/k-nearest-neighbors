Class {
	#name : #AIkNNTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'AI-kNN-Tests'
}

{ #category : #running }
AIkNNTest >> setUp [

	super setUp.
	model := AIkNN new.
	model k: 3.
	{ 
		(10 @ 1).
		(11 @ 2).
		(9 @ 3).
		(8 @ 4) } do: [ :p | model add: p label: 1 ].
	{ 
		(-10 @ 1).
		(-11 @ 2).
		(-9 @ 3) } do: [ :p | model add: p label: 0 ]
]

{ #category : #testing }
AIkNNTest >> testClassifyWithEmptyModel [

	"It shouldnt work since there is no neighbors"
self skip.
	model := AIkNN new.
	self should: [ model classify: 6 @ 0 ] raise: Error
]

{ #category : #testing }
AIkNNTest >> testClassifyWithLabelAsFloat [

	model := AIkNN new.
	model k: 3.
	{ 
		(10 @ 1).
		(11 @ 2).
		(9 @ 3).
		(8 @ 4) } do: [ :p | model add: p label: 1.5 ].
	{ 
		(-10 @ 1).
		(-11 @ 2).
		(-9 @ 3) } do: [ :p | model add: p label: 0.5 ].

	self assert: (model classify: 6 @ 0) equals: 1.5.
	self assert: (model classify: -6 @ 0) equals: 0.5
]

{ #category : #testing }
AIkNNTest >> testClassifyWithLabelAsInteger [

	self assert: (model classify: 6 @ 0) equals: 1.
	self assert: (model classify: -6 @ 0) equals: 0
]

{ #category : #testing }
AIkNNTest >> testClassifyWithLabelAsString [

	model := AIkNN new.
	model k: 3.
	{ 
		(10 @ 1).
		(11 @ 2).
		(9 @ 3).
		(8 @ 4) } do: [ :p | model add: p label: 'a' ].
	{ 
		(-10 @ 1).
		(-11 @ 2).
		(-9 @ 3) } do: [ :p | model add: p label: 'b' ].
		
	self assert: (model classify: 6 @ 0) equals: 'a'.
	self assert: (model classify: -6 @ 0) equals: 'b'
]

{ #category : #testing }
AIkNNTest >> testClassifyWithMixedLabel [

	model := AIkNN new.
	model k: 3.
	{ 
		(10 @ 1).
		(11 @ 2).
		(9 @ 3).
		(8 @ 4) } do: [ :p | model add: p label: 'a' ].
	{ 
		(-10 @ 1).
		(-11 @ 2).
		(-9 @ 3) } do: [ :p | model add: p label: 1 ].

	self assert: (model classify: 6 @ 0) equals: 'a'.
	self assert: (model classify: -6 @ 0) equals: 1
]

{ #category : #testing }
AIkNNTest >> testNeighbors [
	self assert: ( ( model neighborsOf: 10@0 ) allSatisfy: [ :p | p label = 1 ] ).
	self assert: ( ( model neighborsOf: -10@0 ) allSatisfy: [ :p | p label = 0 ] ).
]

{ #category : #testing }
AIkNNTest >> testTooFewNeighbors [
"It shouldnt work since there is not 100 neighbors"
	model k: 100.
	self assert: (model classify: 6 @ 0) equals: 1.
	self assert: (model classify: -6 @ 0) equals: 0
]
