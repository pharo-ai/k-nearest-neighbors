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
				package: 'AI-kNN-Tests'	with: [ spec requires: #('AI-MLkNN') ].
			spec 
				group: 'Core' 						with: #('AI-MLkNN');
				group: 'Tests' 						with: #('AI-MLkNN' 'AI-MLkNN-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
