Class {
	#name : #AIKNearestNeighborsTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'AI-kNN-Tests'
}

{ #category : #running }
AIKNearestNeighborsTest >> setUp [

	super setUp.
	model := AIKNearestNeighbors new.
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
AIKNearestNeighborsTest >> testClassifyWithEmptyModel [

	"It shouldnt work since there is no neighbors"

	model := AIKNearestNeighbors new.
	self should: [ model classify: 6 @ 0 ] raise: Error
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithLabelAsFloat [

	model := AIKNearestNeighbors new.
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
AIKNearestNeighborsTest >> testClassifyWithLabelAsInteger [

	self assert: (model classify: 6 @ 0) equals: 1.
	self assert: (model classify: -6 @ 0) equals: 0
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithLabelAsString [

	model := AIKNearestNeighbors new.
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
AIKNearestNeighborsTest >> testClassifyWithMixedLabel [

	model := AIKNearestNeighbors new.
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
AIKNearestNeighborsTest >> testNeighbors [
	self assert: ( ( model neighborsOf: 10@0 ) allSatisfy: [ :p | p label = 1 ] ).
	self assert: ( ( model neighborsOf: -10@0 ) allSatisfy: [ :p | p label = 0 ] ).
]

{ #category : #testing }
AIKNearestNeighborsTest >> testTooFewNeighbors [
"It shouldnt work since there is not 100 neighbors"
	model k: 100.
	self assert: (model classify: 6 @ 0) equals: 1.
	self assert: (model classify: -6 @ 0) equals: 0
]
