//
//  StackHolder.swift
//  CredLikeAnimation
//
//  Created by Arun Jangid on 14/01/22.
//

import UIKit

let maxStackView = 3

class StackHolder: UIView {

    private var currentPresenting : Int = 0
    private var stackList:[StackCardView] = []
    
    var heightDifference : CGFloat = 0.2
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
    
    
    func addBaseView(baseView:UIView){
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
    
    // adding stack maximum 3 
    func addStackView(stackView:StackCardView){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.currentCardNumber = stackList.count + 1
        self.addSubview(stackView)
        let multiplier = (1.0 - (heightDifference * CGFloat(stackList.count)))
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: baseBgView.heightAnchor, multiplier: multiplier)
          ])
        
        if stackList.count < maxStackView{
            stackList.append(stackView)
        }        
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
    func dismissStacks(){
        
        if let stackCard = getStackCard(number: currentPresenting){
            stackCard.dismissView()
        }
        if let stackCard = getStackCard(number: currentPresenting - 1){
            stackCard.hideOverlapView()
        }
        currentPresenting = currentPresenting - 1
    }
        
}
