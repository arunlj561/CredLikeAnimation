//
//  ViewController.swift
//  CredLikeAnimation
//
//  Created by Arun Jangid on 13/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackCardFirst: StackCardView!
    @IBOutlet weak var stackCardSecond: StackCardView!
    @IBOutlet weak var stackCardThird: StackCardView!
    
    @IBOutlet var stackViewCollection: [StackCardView]!
    
    
    @IBOutlet weak var stackHolder: StackHolder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackCardFirst.delegate = self
        stackCardThird.delegate = self
        stackCardSecond.delegate = self
        stackHolder.addStackView(stackView: stackCardFirst)
        stackHolder.addStackView(stackView: stackCardSecond)
        stackHolder.addStackView(stackView: stackCardThird)
    }

    @IBAction func actionTappedCTA(_ sender: UIButton) {
        if let title = stackHolder.showNextStack(){
            sender.setTitle(title, for: .normal)
        }
    }
    
}

extension ViewController : CardActionDelegate{

    func dismissCurrentCard(cardNumber: Int) {
        stackHolder.dismissStacks()
    }
}
