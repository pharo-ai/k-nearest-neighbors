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
	#name : #AIkNN,
	#superclass : #Object,
	#instVars : [
		'k',
		'data'
	],
	#category : #'AI-kNN'
}

{ #category : #adding }
AIkNN >> add: example label: label [
	"Add a labelled example to the training set."
	data add: ( AIkNNLabelledExample new label: label; example: example )
]

{ #category : #classification }
AIkNN >> classify: example [
	"Returns the label predicted for example"
	^ self majorityLabel: ( self neighborsOf: example )
]

{ #category : #initialization }
AIkNN >> initialize [
	super initialize.
	k := 1.
	data := OrderedCollection new.
]

{ #category : #accessing }
AIkNN >> k [
	^ k
]

{ #category : #accessing }
AIkNN >> k: anObject [
	k := anObject
]

{ #category : #classification }
AIkNN >> majorityLabel: neighbors [
	"Returns the most common label in the neighbors collection"
	^ neighbors isEmpty ifTrue: nil
		ifFalse: [ ( neighbors collect: #label ) asBag sortedCounts first value ]
]

{ #category : #classification }
AIkNN >> neighborsOf: example [
	^ self neighborsOf: example k: ( k min: data size ).
]

{ #category : #classification }
AIkNN >> neighborsOf: example k: numNeighbors [

	"Return the numNeighbors clasest neighbors to example."

	| neighbors |
	neighbors := SortedCollection new
		             sortBlock: [ :a :b | 
			             (b example distanceTo: example)
			             <= (a example distanceTo: example) ];
		             addAll: (data copyFrom: 1 to: numNeighbors);
		             reSort. "Initialize a bounded priority queue of neighbors,"
	data do: [ :d | 
		(example distanceTo: d example)
		< (example distanceTo: neighbors first example) ifTrue: [ 
			neighbors
				removeFirst;
				add: d ] ]. "and swap in closer neighbors as they are found."
	^ neighbors
]

{ #category : #training }
AIkNN >> train [
	"As a lazy classifier, KNN has no need for explicit training"
]
