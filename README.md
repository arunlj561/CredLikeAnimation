# CredLikeAnimation

StackHolder.swift 

It manages all the stack views, presenting and dismissing the correct stack card. 
We need to add the (stack)views which needs to be handled by the stack holder by using below method 

  /// function is used to add base view & stackviews
    /// - Parameters:
    ///   - baseView: base view or bg view which is static
    ///   - stackViews: array of stackviews need to be added maximum 3
    ///   - cardDelegate: delegate to know which card has been dismissed
    func addStackViews(baseView:UIView, stackViews:[StackCardView], cardDelegate:CardActionDelegate){
        self.addBaseView(baseView: baseView)


StackCardView.swift
Add view from storyboard assign it class as StackCardView.swift, this will be the card class which needs to be added into Stackholder.
It handles the 2 states - Expand/Collapse. When it is tapped according to current state it manages the state. 

You can add the custom view from storyboard or directly 



