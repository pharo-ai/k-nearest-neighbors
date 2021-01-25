Class {
	#name : #BaselineOfAIkNN,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIkNN
}

{ #category : #baselines }
BaselineOfAIkNN >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'AI-kNN';
				package: 'AI-kNN-Tests'	with: [ spec requires: #('AI-kNN') ].
			spec 
				group: 'Core' 						with: #('AI-kNN');
				group: 'Tests' 						with: #('AI-kNN' 'AI-kNN-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
