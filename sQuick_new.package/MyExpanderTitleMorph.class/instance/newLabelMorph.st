instance creation
newLabelMorph
	"Answer a new label morph for the receiver."

	^TextMorph new
		hResizing: #spaceFill;
		vResizing: #shrinkWrap