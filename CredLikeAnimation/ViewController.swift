//
//  ViewController.swift
//  CredLikeAnimation
//
//  Created by Arun Jangid on 13/01/22.
//

import UIKit

/**
 To check for 2 cards
 To Edit the stack card you can comment line number 38
 
 Go to Main.storyboard
 Select stackCardSecond go to inspector keep the current number as 1
 Select stackCardThird go to inspector keep the current number as 2
 */


class ViewController: UIViewController {

    @IBOutlet weak var stackCardBg: UIView!
    @IBOutlet weak var stackCardFirst: StackCardView!
    @IBOutlet weak var stackCardSecond: StackCardView!
    @IBOutlet weak var stackCardThird: StackCardView!
    
    
    @IBOutlet weak var stackHolder: StackHolder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackCardFirst.delegate = self
        stackCardThird.delegate = self
        stackCardSecond.delegate = self
        
        // Addding Base view which will not collapse and will be a background view 
        stackHolder.addBaseView(baseView: stackCardBg)
        
        // Addding UI which we want to be collapse
        stackHolder.addStackView(stackView: stackCardSecond)
        stackHolder.addStackView(stackView: stackCardFirst)
        stackHolder.addStackView(stackView: stackCardThird)
        
    }

    @IBAction func actionTappedCTA(_ sender: UIButton) {
        stackHolder.showNextStack()
    }
    
    @IBAction func actionSubmitTheForm(){
        stackHolder.showNextStack()
    }
    @IBAction func actionSelectYourbank(){
        stackHolder.showNextStack()
    }
    
    @IBAction func actionTapFor1ClickKYC(){
        stackHolder.showNextStack()
    }
    
    
}

extension ViewController : CardActionDelegate{

    func dismissCurrentCard(cardNumber: Int) {
        stackHolder.dismissStacks()
    }
}
