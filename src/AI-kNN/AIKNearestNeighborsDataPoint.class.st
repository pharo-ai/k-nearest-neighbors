Class {
	#name : #AIKNearestNeighborsDataPoint,
	#superclass : #Object,
	#instVars : [
		'label',
		'point'
	],
	#category : #'AI-kNN'
}

{ #category : #'instance creation' }
AIKNearestNeighborsDataPoint class >> point: aPoint label: aLabel [

	^ self new
		point: aPoint;
		label: aLabel;
		yourself
]

{ #category : #accessing }
AIKNearestNeighborsDataPoint >> dist: labelledExample [

	^ point distanceTo: labelledExample example
]

{ #category : #accessing }
AIKNearestNeighborsDataPoint >> label [

	^ label
]

{ #category : #accessing }
AIKNearestNeighborsDataPoint >> label: anObject [

	label := anObject
]

{ #category : #accessing }
AIKNearestNeighborsDataPoint >> point [

	^ point
]

{ #category : #accessing }
AIKNearestNeighborsDataPoint >> point: anObject [

	point := anObject
]

{ #category : #printing }
AIKNearestNeighborsDataPoint >> printOn: aStream [

	aStream nextPut: $[.
	point printOn: aStream.
	aStream nextPutAll: ' --> '.
	label printOn: aStream.
	aStream nextPut: $]
]
