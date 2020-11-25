Class {
	#name : #MLkNNLabelledExample,
	#superclass : #Object,
	#instVars : [
		'example',
		'label'
	],
	#category : #MLkNN
}

{ #category : #accessing }
MLkNNLabelledExample >> dist: labelledExample [
	^ example dist: labelledExample example
]

{ #category : #accessing }
MLkNNLabelledExample >> example [
	^ example
]

{ #category : #accessing }
MLkNNLabelledExample >> example: anObject [
	example := anObject
]

{ #category : #accessing }
MLkNNLabelledExample >> label [
	^ label
]

{ #category : #accessing }
MLkNNLabelledExample >> label: anObject [
	label := anObject
]

{ #category : #printing }
MLkNNLabelledExample >> printOn: aStream [
	aStream nextPut: $[.
	self example printOn: aStream.
	aStream nextPutAll: ' --> '.
	self label printOn: aStream.
	aStream nextPut: $].
]
