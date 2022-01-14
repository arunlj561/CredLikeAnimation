//
//  CollapseStackView.swift
//  CredLikeAnimation
//
//  Created by Arun Jangid on 13/01/22.
//

import UIKit

@IBDesignable
class StackCardView: UIView {

    @IBInspectable var currentCardNumber : Int = 1
    
    private var currentCardState : CardState = .collapse
    
    private lazy var overlapView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate:CardActionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
      
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
      
    private func setupView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userTappedBottomButton(sender:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        alpha = 0
        dismissView(isInitial: true)
        addSubview(overlapView)
        setupLayout()
        self.hideOverlapView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            overlapView.topAnchor.constraint(equalTo: topAnchor),
            overlapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overlapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overlapView.bottomAnchor.constraint(equalTo: bottomAnchor)
          ])
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    @objc func userTappedBottomButton(sender:UITapGestureRecognizer){
        print(currentCardState)
        switch currentCardState {
        case .collapse:
            break            
        case .expanded:
            delegate?.dismissCurrentCard(cardNumber: self.currentCardNumber)        
        }
    }
    
    func isExpanded() -> Bool{        
        return self.currentCardState == .expanded
    }
    
    func dismissView(isInitial:Bool = false){
        if !isInitial {
            alpha = 1
        }
        currentCardState = .collapse
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
            self.transform = CGAffineTransform.init(translationX: 0, y: self.frame.height * 2)
        }
    }
    func showView(){
        alpha = 0
        currentCardState = .expanded
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform.identity
            self.alpha = 1
        }
    }
    
    func showOverlapView(){
        overlapView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.overlapView.transform = CGAffineTransform.identity
            self.overlapView.alpha = 1
        }
    }
    func hideOverlapView(){
        overlapView.alpha = 1
        UIView.animate(withDuration: 0.5) {
            self.overlapView.transform = CGAffineTransform.init(translationX: 0, y: self.overlapView.frame.height * 2)
            self.overlapView.alpha = 0
        }
    }
}
