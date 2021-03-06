initialization
initialize	
	| font resourceFolder resourcePath d popUp aPoint header browseOptn browseBtn searchFor srchBtn helpBtn aboutBtn feedBtn timeStamp dateStamp searchForHeader   boxPanel |
	
	MCGitHubRepository allSubInstancesDo: 
									[ :repo |
										 repo projectPath = 'jig08/sQuick_new'  ifTrue: [ resourcePath := repo directory ] 
									]. 
	resourceFolder  := resourcePath / 'sQuick_new/resources'.
	
	font := StandardFonts defaultFont .
	StandardFonts listFont: font .
	StandardFonts menuFont: font.
	StandardFonts codeFont: font .
	StandardFonts buttonFont: font .
	StandardFonts defaultFont: font .
	StandardFonts windowTitleFont: font.
		
	header := ImageMorph withForm: (Form fromFileNamed: resourceFolder / 'rsz_header.gif').
	header position: 0@0.
		
	browseOptn := TextMorph new.
	browseOptn newContents: 'Scan through the topical text collection available ! Click BROWSE FILES. Also check out how to add new text in the HELP section'.
	browseOptn position: (World extent x/6.5)@(World extent y/2.4).
	browseOptn extent: (World extent x/3.25)@(World extent y/14.88).
	
	browseBtn := self myButtonWithLabel: 'Browse Files' color: Color paleTan borderColor: Color brown helpText: 'Click to browse files' position: (World extent x/1.85)@(World extent y/2.48).
	browseBtn on: #click send: #value to: [self boxWindow window close. IndexInterface delete. BrowseFiles open].
		
	popUp := PopUp basicNew.
	
	searchForHeader := ImageMorph withForm: (Form fromFileNamed: resourceFolder / 'searchHeader.gif').
	searchForHeader position: (World extent x/5.65)@(World extent y/3.72).
	
	searchFor := PluggableTextFieldMorph  on: popUp text: #myString  accept: #myString: .
	searchFor acceptOnCR: true.
	searchFor position: (World extent x/6.5)@(World extent y/5.72).
	searchFor height: (World extent y/24.8).
	searchFor width: World extent x/2.9.
	searchFor ghostText: 'Type the search string ...'.
	searchFor borderWidth: 1.
	
	srchBtn := self myButtonWithLabel: 'Search' color: Color paleTan borderColor: Color brown helpText: 'Click to search for the entered string' position: (World extent x/1.85)@(World extent y/6.2).
	srchBtn on: #click 
			send: #value 
			to: 
			[   searchFor accept . 
			    (popUp myString isNil) 
				ifTrue: [self errorPopUp.] 
				ifFalse: [ popUp printSearchResults . ]
			].
	
	helpBtn := self myButtonWithLabel: 'Help | Tutorial' color: Color paleTan borderColor: Color brown helpText: 'Click here to seek help on using searchQuick' position: (World extent x/6.5)@(World extent y/1.86).
	helpBtn on: #click send: #value to: [ self helpPopUp. ].
	
	aboutBtn := self myButtonWithLabel: 'About sQuick' color: Color paleTan borderColor: Color brown helpText: 'Click to see details of searchQuick' position: (World extent x /2.95)@(World extent y/1.86 ).
	aboutBtn on: #click send: #value to: [ self aboutPopUp. ].
	
	feedBtn := self myButtonWithLabel: 'Feedback' color: Color paleTan borderColor: Color brown helpText: 'Click for contact details of searchQuick' position: (World extent x/1.858)@(World extent y/1.86 ).
	feedBtn on: #click send: #value to: [ self feedPopUp. ].
	
	timeStamp := TextMorph new.
	d := DateAndTime now asTime.
	timeStamp newContents: 'Time: ', d asString .
	timeStamp position: (World extent x/6.5)@(World extent y/1.488).
	timeStamp extent: (World extent x/5.673)@(World extent y/14.88).
	
	dateStamp := TextMorph new.
	d := DateAndTime now asDate printFormat: #(1 2 3 $/ 1 1).
	dateStamp newContents: 'Date: ', d asString .
	dateStamp  position: (World extent x/6.5)@(World extent y/1.444).
	dateStamp  extent: (World extent x/5.673)@(World extent y/14.88).
	
	codeLink := TextMorph new.
	codeLink newContents: 'Code Repository: github.com/jig08/sQuick_new'.
	codeLink position: (World extent x/2.365)@(World extent y/1.488).
	codeLink extent: (World extent x/3.25)@(World extent y/14.88).
	
	box := ImageMorph withForm: (Form fromFileNamed: resourceFolder / 'rsz_bg.gif').
	aPoint := World extent.
	box extent: aPoint .
	
	box addMorph: header.
	box addMorph: searchFor .
	box addMorph: searchForHeader .
	box addMorph: srchBtn.
	box addMorph: browseOptn .
	box addMorph: browseBtn.
	box addMorph: helpBtn .
	box addMorph: aboutBtn.
	box addMorph: feedBtn .
	box addMorph: dateStamp.
	box addMorph: timeStamp.
	box addMorph: codeLink .
	
  	boxPanel := Morph new
        				color: Color black;
        				changeTableLayout;
        				wrapCentering: #center;
        				addMorph: box;
        		yourself.
   	  boxWindow := boxPanel openInWindow.
   	  boxWindow setLabel: 'searchQuick'.
  	  boxWindow fullscreen.
   	 boxWindow extent: World extent.
   	 boxWindow position: 0@0. 