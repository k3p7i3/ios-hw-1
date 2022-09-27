//
//  ViewController.swift
//  pikopyrinaPW1
//
//  Created by Polina Kopyrina on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let buttonPressed = sender as? UIButton
        buttonPressed?.isEnabled = false
        
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        
        UIView.animate(
            withDuration: 2,
            animations: {
                for view in self.views{
                    view.backgroundColor = set.popFirst()
                    view.layer.cornerRadius = CGFloat.random(
                        in: 0 ..< min(view.bounds.height, view.bounds.width) / 2
                    )
                }
            }) { completion in
                buttonPressed?.isEnabled = true
            }
    }


}

