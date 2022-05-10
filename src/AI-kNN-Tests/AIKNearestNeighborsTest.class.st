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

	| x y pointsWithLabelOne pointsWithLabelZero |
	super setUp.
	pointsWithLabelOne := #( #( 10 1 ) #( 11 2 ) #( 9 3 ) #( 8 4 ) ).
	pointsWithLabelZero := #( #( -10 1 ) #( -11 2 ) #( -9 3 ) ).
	x := pointsWithLabelOne , pointsWithLabelZero.
	y := (Array new: pointsWithLabelOne size withAll: 1) , (Array new: pointsWithLabelZero size withAll: 0).
	
	model := AIKNearestNeighbors new.
	model
		k: 3;
		fitX: x y: y
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithEmptyModel [

	"It shouldnt work since there is no neighbors"

	model := AIKNearestNeighbors new.
	self should: [ model predict: #( #( 6 0 ) ) ] raise: Error
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithLabelAsFloat [

	| pointsWithLabelOnePointFive pointsWithLabelZeroPointFive x y |
	pointsWithLabelOnePointFive := #( #( 10 1 ) #( 11 2 ) #( 9 3 ) #( 8 4 ) ).
	pointsWithLabelZeroPointFive := #( #( -10 1 ) #( -11 2 ) #( -9 3 ) ).
	x := pointsWithLabelOnePointFive , pointsWithLabelZeroPointFive.
	y := (Array new: pointsWithLabelOnePointFive size withAll: 1.5) , (Array new: pointsWithLabelZeroPointFive size withAll: 0.5).

	model
		k: 3;
		fitX: x y: y.

	self
		assert: (model predict: #( #( 6 0 ) #( -6 0 ) ))
		equals: #( 1.5 0.5 )
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithLabelAsInteger [

	self
		assert: (model predict: #( #( 6 0 ) #( -6 0 ) ))
		equals: #( 1 0 )
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithLabelAsString [

	| pointsWithLabelA pointsWithLabelB x y |
	pointsWithLabelA := #( #( 10 1 ) #( 11 2 ) #( 9 3 ) #( 8 4 ) ).
	pointsWithLabelB := #( #( -10 1 ) #( -11 2 ) #( -9 3 ) ).
	x := pointsWithLabelA , pointsWithLabelB.
	y := (Array new: pointsWithLabelA size withAll: 'a') , (Array new: pointsWithLabelB size withAll: 'b').

	model
		k: 3;
		fitX: x y: y.

	self
		assert: (model predict: #( #( 6 0 ) #( -6 0 ) ))
		equals: #( 'a' 'b' )
]

{ #category : #testing }
AIKNearestNeighborsTest >> testClassifyWithMixedLabel [

	| pointsWithLabelA pointsWithLabelOne x y |
	pointsWithLabelA := #( #( 10 1 ) #( 11 2 ) #( 9 3 ) #( 8 4 ) ).
	pointsWithLabelOne := #( #( -10 1 ) #( -11 2 ) #( -9 3 ) ).
	x := pointsWithLabelA , pointsWithLabelOne.
	y := (Array new: pointsWithLabelA size withAll: 'a') , (Array new: pointsWithLabelOne size withAll: 1).

	model
		k: 3;
		fitX: x y: y.

	self
		assert: (model predict: #( #( 6 0 ) #( -6 0 ) ))
		equals: #( 'a' 1 )
]
