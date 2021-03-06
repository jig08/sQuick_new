Print Search Results
printSearchResults
	| x scrollPane expanders exX searchBtn |
	
	dialog ifNotNil: [ dialog delete ].
	
	IndexInterface delete . 
	self open. 
	SearchQuick searchQuick: self myString.		
	dialog := (builder newPluggableDialogWindow: 'SEARCH  RESULTS  FOR').
	dialog buttons: {  }.
	
	exX := (World extent x)-40.
		
	expanders := dialog newColumn: 
 							(
								SearchQuick myResult collect: [ :r |
												
												x  := MyExpanderTitleMorph new.
												x titleText: (('TITLE: ', r title asString, String cr, 'CONTENT:  ', r content asString, '......' ) truncateWithElipsisTo: 55).
												x width: World extent x/1.03.
												
 												dialog newRow: {
 														(
 															(
																dialog newExpander: (r title asString  ) 
 																forAll: {
																		(  dialog newTextEditorFor: (  ValueHolder new contents: r content asString   )
																		 getText: #contents setText: #contents:  )height: (World extent y)/3;width:World extent x/1.03.
																	    }
 															)width:World extent x/1.03; height: World extent y/74.4;color: Color paleMagenta; titleMorph: x; yourself 
 														)
 																cellInset: 0;
 																borderStyle: (BorderStyle inset baseColor: dialog paneColor; width: 1)
 																		} 
															]
							).
	
	expanders bounds: (Rectangle origin: 15@10 extent: exX@(World extent y)  ).
	scrollPane := dialog newScrollPaneFor: expanders.
	scrollPane
		scrollTarget: expanders;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		minHeight: (World extent y)/4;
		minWidth: (World extent x)/(2.5).
		
	searchResultsAccordion :=  dialog contentMorph:
			(
				dialog newColumn: {
				        	dialog newRow: { 
							searchBar := dialog newTextEntryFor:  self getText:  #myString  setText:  #myString:  help: myString asString .
							searchBar acceptOnCR: true.
							searchBar width: World extent x/1.43.
							searchBar height: (World extent y)/25.
							searchBar color: Color paleOrange .
							
							searchBtn  := dialog newButtonFor: self action:  #searchButtonClicked label:  'SEARCH' help:  'SEARCH'.
							searchBtn width: World extent x/3.45.
							searchBtn height: (World extent y)/25.
							searchBtn color: Color orange.
							searchBtn borderColor: Color orange .
								     } .
				
					scrollPane.
							
					backBtn := dialog newButtonFor: self action: #backButtonClicked label: 'BACK' help: 'Back'.
					backBtn width: World extent x/1.005.
					backBtn height: (World extent y)/25.
					backBtn color: Color orange.
					backBtn borderColor: Color orange .
					backBtn borderWidth: 2.
							}
 			); minWidth: exX; minHeight: World extent y;
			model: nil.
	
	searchResultsAccordion position: 0@0.
	searchResultsAccordion extent: World extent.
	searchResultsAccordion width: World extent x.
	searchResultsAccordion height: World extent y.
	dialog position: 0@0.
	dialog  extent: World extent.	
	dialog buttons: nil.
	dialog openFullscreen.
	dialog color: Color black.