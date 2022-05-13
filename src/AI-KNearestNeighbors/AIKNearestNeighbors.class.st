"
I am a K-NearestNeighbors classifier. 

I store my data in instances of AIKNearestNeighborsDataPoint, and return class labels for unclassified test examples.

```
model := AIKNearestNeighbors new.
model
	k: 3;
	fitX: #( #(0 0) #(1 0) #(0 1) ) y: #(0 1 1).
```

```
model predict: #( #(1 1) )
""Returns 1, because 1@0 and 0@1 are the nearest neighbors.""
```


"
Class {
	#name : #AIKNearestNeighbors,
	#superclass : #Object,
	#instVars : [
		'k',
		'data',
		'distance'
	],
	#category : #'AI-KNearestNeighbors'
}

{ #category : #'instance creation' }
AIKNearestNeighbors class >> k: anInteger [

	^ self new
		k: anInteger;
		yourself
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
	k := 1
]

{ #category : #accessing }
AIKNearestNeighbors >> k [

	^ k
]

{ #category : #api }
AIKNearestNeighbors >> k: anInteger [

	k := anInteger
]

{ #category : #classification }
AIKNearestNeighbors >> kNeighborsOf: aPoint [

	| sortedNeighborsOfPoint |
	
	sortedNeighborsOfPoint := data copy sort: [:a :b |
		(distance distanceBetween: a point and: aPoint) <= (distance distanceBetween: b point and: aPoint) ].
	
	^ sortedNeighborsOfPoint first: k	
]

{ #category : #classification }
AIKNearestNeighbors >> majorityLabel: neighbors [

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
AIKNearestNeighbors >> useHammingDistance [

	distance := AIHammingDistance new
]

{ #category : #api }
AIKNearestNeighbors >> useManhattanDistance [

	distance := AIManhattanDistance new
]

{ #category : #api }
AIKNearestNeighbors >> useMinkowskiDistanceWithPValue: anInteger [

	distance := AIMinkowskiDistance p: anInteger
]
