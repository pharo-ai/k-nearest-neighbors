"
I am a rudimentary K-NearestNeighbors classifier. 

I store my data in instances of LabelledExample, and return class labels for unclassified test examples.

model := KNN new 
	k: 3;
	add: 0@0 label: 0;
	add: 1@0 label: 1;
	add: 0@1 label: 1.
model classify: 1@1. ""Returns 1, because 1@0 and 0@1 were the nearest neighbors.""
"
Class {
	#name : #AIKNearestNeighbors,
	#superclass : #Object,
	#instVars : [
		'k',
		'data',
		'distance'
	],
	#category : #'AI-kNN'
}

{ #category : #classification }
AIKNearestNeighbors >> classify: example [

	^ self
		deprecated: ''
		transformWith: '`@r classify: `q' -> '`@r predict: `q'
]

{ #category : #api }
AIKNearestNeighbors >> fitX: inputMatrix y: actualValues [

	data := inputMatrix with: actualValues collect: [ :aPoint :aLabel | 
		AIKNearestNeighborsDataPoint point: aPoint label: aLabel ]
]

{ #category : #initialization }
AIKNearestNeighbors >> initialize [

	super initialize.
	self useEuclideanDistance.
	k := 1.
	data := OrderedCollection new
]

{ #category : #accessing }
AIKNearestNeighbors >> k [
	^ k
]

{ #category : #accessing }
AIKNearestNeighbors >> k: anObject [
	k := anObject
]

{ #category : #classification }
AIKNearestNeighbors >> kNeighborsOf: aPoint [

	"| distances sortedNeighbors |
	distances := data collect: [ :knnDataPoint | 
		distance distanceBetween: knnDataPoint point and: aPoint ].
	
	sortedNeighbors := distances sort: [:a :b | a <= b].
	^ sortedNeighbors first: numNeighbors"

	| sortedNeighborsOfPoint |
	
	sortedNeighborsOfPoint := data copy sort: [:a :b |
		(distance distanceBetween: a point and: aPoint) <= (distance distanceBetween: b point and: aPoint) ].
	
	^ sortedNeighborsOfPoint first: k	
]

{ #category : #classification }
AIKNearestNeighbors >> majorityLabel: neighbors [

	"^ neighbors isEmpty
		ifTrue: nil
		ifFalse: [ (neighbors collect: #label) asBag sortedCounts first value ]"

	^ (neighbors collect: [ :each | each label ]) asBag sortedCounts first value
]

{ #category : #api }
AIKNearestNeighbors >> predict: aCollectionOfPoints [

	^ aCollectionOfPoints collect: [ :aPoint | 
		| neighbors |
		neighbors := self kNeighborsOf: aPoint.
		self majorityLabel: neighbors ]
]

{ #category : #api }
AIKNearestNeighbors >> useEuclideanDistance [

	distance := AIEuclideanDistance new
]

{ #category : #api }
AIKNearestNeighbors >> useManhattanDistance [

	distance := AIManhattanDistance new
]
