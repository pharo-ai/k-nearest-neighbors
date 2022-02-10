Class {
	#name : #AIkNNLabelledExampleTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'AI-kNN-Tests'
}

{ #category : #running }
AIkNNLabelledExampleTest >> setUp [
	super setUp.
	model := AIkNNLabelledExample new
			 label: 1;
			 example: (10 @ 1)
]

{ #category : #running }
AIkNNLabelledExampleTest >> testDist [

	| model1 |
	model1 := AIkNNLabelledExample new
		          label: 1;
		          example: 9 @ 1.
	self assert: (model dist: model1) equals: 1
]

{ #category : #running }
AIkNNLabelledExampleTest >> testPrintOn [

	self assert: model printString equals: '[(10@1) --> 1]'
]
