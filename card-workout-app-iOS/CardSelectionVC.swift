//
//  CardSelectionVC.swift
//  card-workout-app-iOS
//
//  Created by Homit Dalia on 17/02/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var rulesButton: UIButton!
    
    var timer: Timer!
    let cardGroups: [String] = ["C", "S", "D", "H"]
    let cardValues: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = UIImage(named: (cardValues.randomElement()?.appending(cardGroups.randomElement() ?? "A")) ?? "S")
    }
    
    @IBAction func startPress(_ sender: Any) {
        startTimer()
    }
    
    @IBAction func stopPress(_ sender: Any) {
        print("In HandleOnPRess STOP")
        timer.invalidate()
    }
}
