Class {
	#name : #BaselineOfAIkNN,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIkNN
}

{ #category : #baselines }
BaselineOfAIkNN >> baseline: spec [

	<baseline>
	spec for: #( common ) do: [
		"Internal dependencies"
		spec
			baseline: 'AIInternalEditDistances'
			with: [ spec repository: 'github://pharo-ai/external-dependencies' ].
			
		"Packages"
		spec
			package: 'AI-kNN' with: [ spec requires: #( 'AIInternalEditDistances' ) ];
			package: 'AI-kNN-Tests' with: [ spec requires: #( 'AI-kNN' ) ].

		spec
			group: 'Core' with: #( 'AI-kNN' );
			group: 'Tests' with: #( 'AI-kNN' 'AI-kNN-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]
