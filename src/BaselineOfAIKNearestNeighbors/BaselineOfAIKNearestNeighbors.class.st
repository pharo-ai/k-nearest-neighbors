Class {
	#name : #BaselineOfAIKNearestNeighbors,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIKNearestNeighbors
}

{ #category : #baselines }
BaselineOfAIKNearestNeighbors >> baseline: spec [

	<baseline>
	spec for: #( common ) do: [
		"pharo-ai dependencies"
		spec
			baseline: 'AIEditDistances' 
			with: [ spec repository: 'github://pharo-ai/edit-distances/src' ].
			
		"Packages"
		spec
			package: 'AI-KNearestNeighbors' with: [ spec requires: #( 'AIEditDistances' ) ];
			package: 'AI-KNearestNeighbors-Tests' with: [ spec requires: #( 'AI-KNearestNeighbors' ) ].

		spec
			group: 'Core' with: #( 'AI-KNearestNeighbors' );
			group: 'Tests' with: #( 'AI-KNearestNeighbors' 'AI-KNearestNeighbors-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]
