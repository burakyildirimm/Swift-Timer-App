//
//  ViewController.swift
//  Timer App
//
//  Created by burak on 25.12.2017.
//  Copyright © 2017 Burak Yıldırım. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var randomLabel: UILabel!
    @IBOutlet weak var randomText: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var timer = Timer()
    var randomTimer = Timer()
    var count = Int()
    var random = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.isHidden = true
        count = 30
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerr), userInfo: nil, repeats: true)
        randomTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(ViewController.getRandom), userInfo: nil, repeats: true)
        random = Int(arc4random_uniform(UInt32(99)))
        randomLabel.text = "Query: \(random)"
    }
    
    @objc func getRandom() {
        random = Int(arc4random_uniform(UInt32(99)))
        randomLabel.text = "Query: \(random)"
    }
    
    @objc func timerr() {
        count -= 1
        timerLabel.text = "\(count)"
        if count == 0 {
            count = 30
        }
    }

    @IBAction func sendClicked(_ sender: Any) {
        timer.invalidate()
        randomTimer.invalidate()
        if randomLabel.text == randomText.text {
            let alert = UIAlertController(title: "Correct", message: "Congratulations", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            let reply = UIAlertAction(title: "Reply", style: UIAlertActionStyle.default, handler: { (action) in
                self.count = 30
                self.timerLabel.text = "30"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerr), userInfo: nil, repeats: true)
                self.randomTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(ViewController.getRandom), userInfo: nil, repeats: true)
            })
            alert.addAction(ok)
            alert.addAction(reply)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Wrong", message: "Wrong code please try again!", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            let reply = UIAlertAction(title: "Reply", style: UIAlertActionStyle.default, handler: { (action) in
                self.count = 30
                self.timerLabel.text = "30"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerr), userInfo: nil, repeats: true)
                self.randomTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(ViewController.getRandom), userInfo: nil, repeats: true)
            })
            alert.addAction(okButton)
            alert.addAction(reply)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

