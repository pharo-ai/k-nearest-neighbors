Class {
	#name : #AIKNearestNeighborsDataPoint,
	#superclass : #Object,
	#instVars : [
		'label',
		'point'
	],
	#category : #'AI-KNearestNeighbors'
}

{ #category : #'instance creation' }
AIKNearestNeighborsDataPoint class >> point: aPoint label: aLabel [

	^ self new
		point: aPoint;
		label: aLabel;
		yourself
]

{ #category : #comparing }
AIKNearestNeighborsDataPoint >> = anObject [

	^ self class == anObject class and: [ 
		self point = anObject point and: [ self label == anObject label ] ]
]

{ #category : #accessing }
AIKNearestNeighborsDataPoint >> dist: labelledExample [

	^ point distanceTo: labelledExample example
]

{ #category : #comparing }
AIKNearestNeighborsDataPoint >> hash [

	^ point hash bitXor: label hash
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
