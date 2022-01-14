//
//  StackHolder.swift
//  CredLikeAnimation
//
//  Created by Arun Jangid on 14/01/22.
//

import UIKit

let maxStackView = 3

class StackHolder: UIView {

    var currentPresenting : Int = 0
    
    var stackList:[StackCardView] = []

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
    
    func addStackView(stackView:StackCardView){
        if stackList.count < maxStackView{
            stackList.append(stackView)
        }        
    }
    
    func getStackCard(number:Int) -> StackCardView?{
        return stackList.filter({ $0.currentCardNumber == number }).first
    }
    
    func showNextStack(){
        if let stackCard = getStackCard(number: currentPresenting){
            if currentPresenting < maxStackView{
                stackCard.showOverlapView()
            }
        }
        if let stackCard = getStackCard(number: currentPresenting + 1){
            stackCard.showView()
        }
        
        if currentPresenting < (maxStackView) {
            currentPresenting = currentPresenting + 1
        }
    }
    
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
