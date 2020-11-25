Class {
	#name : #BaselineOfMLkNN,
	#superclass : #BaselineOf,
	#category : #BaselineOfMLkNN
}

{ #category : #baselines }
BaselineOfMLkNN >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'MLkNN';
				package: 'MLkNN-Tests'	with: [ spec requires: #(MLkNN) ].
			spec 
				group: 'Core' 						with: #('MLkNN');
				group: 'Tests' 						with: #('MLkNN' 'MLkNN-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
