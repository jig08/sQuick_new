as yet unclassified
printSearchResults
	|dialog|

	IndexInterface delete . 
	self open. 
	SearchQuick searchQuick: self myString.	
	"builder := WidgetExamples exampleBuilder."	
	dialog := (builder newPluggableDialogWindow: 'RESULTS').
	
	dialog contentMorph:
			(
					dialog newColumn:
 							(
								SearchQuick myResult collect: [ :r |
 												dialog newRow: {
 														(
 															(
																dialog newExpander: r title asString
 																forAll: {		dialog newLabel: r content asString .	}
 															)minWidth:600; minHeight: 10
 														)
 																cellInset: 0;
 																borderStyle: (BorderStyle inset baseColor: dialog paneColor; width: 1)
 																		} 
																		]
							)
 			);
 	model: nil.
 	builder openModal: dialog.