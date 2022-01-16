//
//  StackHolder.swift
//  CredLikeAnimation
//
//  Created by Arun Jangid on 14/01/22.
//

import UIKit

let maxStackView = 4
@IBDesignable
class StackHolder: UIView {

    private var currentPresenting : Int = 0
    private var stackList:[StackCardView] = []
    
    weak var delegate : CardActionDelegate?
        
    @IBInspectable var heightDifference : CGFloat = 0.2
    
    private var baseBgView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
      
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
    
    }
    
    // Use to add Base view
    private func addBaseView(baseView:UIView){
        baseBgView = baseView
        baseBgView.translatesAutoresizingMaskIntoConstraints = false
        baseBgView.tag = 1001
        self.addSubview(baseBgView)
        NSLayoutConstraint.activate([
            baseBgView.topAnchor.constraint(equalTo: topAnchor),
            baseBgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseBgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseBgView.bottomAnchor.constraint(equalTo: bottomAnchor)
          ])
    }
    
    private func updateHeightDiffernce(){
        if stackList.count == 3 {
            if heightDifference > 0.3 {
                heightDifference = 0.2
            }
        }
        if stackList.count == 2 {
            if heightDifference > 0.4{
                heightDifference = 0.4
            }
        }
    }
    
    // adding stack maximum 3
    //:
    
    
    /// function is used to add base view & stackviews
    /// - Parameters:
    ///   - baseView: base view or bg view which is static
    ///   - stackViews: array of stackviews need to be added maximum 3
    ///   - cardDelegate: delegate to know which card has been dismissed
    func addStackViews(baseView:UIView, stackViews:[StackCardView], cardDelegate:CardActionDelegate){
        self.addBaseView(baseView: baseView)
        
        delegate = cardDelegate
        stackList.removeAll()
        self.viewWithTag(2001)?.removeFromSuperview()
        self.viewWithTag(2002)?.removeFromSuperview()
        self.viewWithTag(2003)?.removeFromSuperview()
                
        if stackViews.count < maxStackView{
            stackList.append(contentsOf: stackViews)
            updateHeightDiffernce()
            for (index, i) in stackViews.enumerated() {
                self.addStackView(stackView: i, at: index + 1)
            }
        }
    }
    
    private func addStackView(stackView:StackCardView, at index:Int){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.currentCardNumber = index
        stackView.tag = 2000 + index
        stackView.delegate = self
        self.addSubview(stackView)
        
        let multiplier = (1.0 - (heightDifference * CGFloat(index)))
        // Added for better user experience
        
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: baseBgView.heightAnchor, multiplier: multiplier)
          ])
    }
    
    
    
    private func getStackCard(number:Int) -> StackCardView?{
        return stackList.filter({ $0.currentCardNumber == number }).first
    }
    
    // fetches depending on Current top and then shows next
    func showNextStack(){
        if let stackCard = getStackCard(number: currentPresenting){
            if currentPresenting < stackList.count{
                stackCard.showOverlapView()
            }
        }
        if let stackCard = getStackCard(number: currentPresenting + 1){
            stackCard.showView()
        }
        
        if currentPresenting < (stackList.count) {
            currentPresenting = currentPresenting + 1
        }
    }
    
    // fetches depending on Current top and then dismiss
    private func dismissStacks(){
        
        if let stackCard = getStackCard(number: currentPresenting){
            stackCard.dismissView()
        }
        if let stackCard = getStackCard(number: currentPresenting - 1){
            stackCard.hideOverlapView()
        }
        currentPresenting = currentPresenting - 1
    }
        
}

extension StackHolder: CardActionDelegate{
    func dismissCurrentCard(cardNumber: Int) {
        delegate?.dismissCurrentCard(cardNumber: cardNumber)
        dismissStacks()
    }
}
