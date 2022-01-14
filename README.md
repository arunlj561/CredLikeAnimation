# CredLikeAnimation

StackHolder.swift 

It manages all the stack views, presenting and dismissing the correct stack card. 
We need to add the (stack)views which needs to be handled by the stack holder by using below method 

stackHolder.addStackView(stackView: stackCardFirst)

StackCardView.swift
Add view from storyboard assign it class as StackCardView.swift, this will be the card class which needs to be added into Stackholder.
It handles the 2 states - Expand/Collapse. When it is tapped according to current state it manages the state. 
It has IBInspector property currentCardNumber assign the number to it accordingly that view will be opened. For better experience keep the most visibleview as 1 and going below as 2 and so on. 

You can add the custom view from storyboard as required. 



