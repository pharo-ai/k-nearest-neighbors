Class {
	#name : #AIKNearestNeighborsTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'AI-KNearestNeighbors-Tests'
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

{ #category : #tests }
AIKNearestNeighborsTest >> test3NeighborsOf [

	| points labels neighbors point1 point2 point3 point4 point5 expectedNeighbors |
	point1 := #( 1 1 0 ).
	point2 := #( 3 3 0 ).
	point3 := #( 3 4 0 ).
	point4 := #( 4 3 0 ).
	point5 := #( 4 4 0 ).
	points := { point1 . point2 . point3 . point4 . point5 }.
	labels := #( 0 1 1 1 0 ).

	model fitX: points y: labels.
	model k: 3.

	expectedNeighbors := { point3 . point4 . point5 } with: #(1 1 0) collect: [ :point :label | 
		AIKNearestNeighborsDataPoint point: point label: label ].
	neighbors := model kNeighborsOf: #( 5 5 0 ).

	self assertCollection: neighbors hasSameElements: expectedNeighbors 
]

{ #category : #tests }
AIKNearestNeighborsTest >> test4NeighborsOf [

	| points labels neighbors point1 point2 point3 point4 point5 expectedNeighbors |
	point1 := #( 1 1 0 ).
	point2 := #( 3 3 0 ).
	point3 := #( 3 4 0 ).
	point4 := #( 4 3 0 ).
	point5 := #( 4 4 0 ).
	points := { point1 . point2 . point3 . point4 . point5 }.
	labels := #( 0 1 1 1 0 ).

	model fitX: points y: labels.
	model k: 4.

	expectedNeighbors := { point2 .  point3 . point4 . point5 }
		with: #(1 1 1 0)
		collect: [ :point :label | AIKNearestNeighborsDataPoint point: point label: label ].
	neighbors := model kNeighborsOf: #( 5 5 0 ).

	self assertCollection: neighbors hasSameElements: expectedNeighbors 
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

{ #category : #tests }
AIKNearestNeighborsTest >> testMajorityLabel [

	| points data labels |
	points := #( #( 1 1 0 ) #( 3 3 0 ) #( 3 4 0 ) #( 4 3 0 ) #( 4 4 0 ) ).
	labels := #( 0 1 1 1 0 ).
	data := points with: labels collect: [ :point :label | 
		AIKNearestNeighborsDataPoint point: point label: label ].

	self assert: (model majorityLabel: data) equals: 1
]
