"
An AIKNearestNeighborsDataPointTest is a test class for testing the behavior of AIKNearestNeighborsDataPoint
"
Class {
	#name : #AIKNearestNeighborsDataPointTest,
	#superclass : #TestCase,
	#category : #'AI-KNearestNeighbors-Tests'
}

{ #category : #tests }
AIKNearestNeighborsDataPointTest >> testEqualsSign [

	self
		assert: (AIKNearestNeighborsDataPoint point: #( 1 1 ) label: 1)
		equals: (AIKNearestNeighborsDataPoint point: #( 1 1 ) label: 1)
]

{ #category : #tests }
AIKNearestNeighborsDataPointTest >> testLabel [

	self
		assert: (AIKNearestNeighborsDataPoint point: #( 1 1 ) label: 1) label
		equals: 1
]

{ #category : #tests }
AIKNearestNeighborsDataPointTest >> testPoint [

	self
		assert: (AIKNearestNeighborsDataPoint point: #( 1 1 ) label: 1) point
		equals: #( 1 1 )
]

{ #category : #tests }
AIKNearestNeighborsDataPointTest >> testPrintOn [

	self
		assert: (AIKNearestNeighborsDataPoint point: #( 1 1 ) label: 1) asString
		equals: '#(1 1) --> 1'
]
