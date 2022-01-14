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
    
    // adding stack maximum 3 
    func addStackView(stackView:StackCardView){
        if stackList.count < maxStackView{
            stackList.append(stackView)
        }        
    }
    
    func getStackCard(number:Int) -> StackCardView?{
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
