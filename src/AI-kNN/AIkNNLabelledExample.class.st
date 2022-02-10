Class {
	#name : #AIkNNLabelledExample,
	#superclass : #Object,
	#instVars : [
		'example',
		'label'
	],
	#category : #'AI-kNN'
}

{ #category : #accessing }
AIkNNLabelledExample >> dist: labelledExample [
	^ example dist: labelledExample example
]

{ #category : #accessing }
AIkNNLabelledExample >> example [
	^ example
]

{ #category : #accessing }
AIkNNLabelledExample >> example: anObject [
	example := anObject
]

{ #category : #accessing }
AIkNNLabelledExample >> label [
	^ label
]

{ #category : #accessing }
AIkNNLabelledExample >> label: anObject [
	label := anObject
]

{ #category : #printing }
AIkNNLabelledExample >> printOn: aStream [
	aStream nextPut: $[.
	self example printOn: aStream.
	aStream nextPutAll: ' --> '.
	self label printOn: aStream.
	aStream nextPut: $].
]
