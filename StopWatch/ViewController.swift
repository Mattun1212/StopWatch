//
//  ViewController.swift
//  StopWatch
//
//  Created by Koutaro Matsushita on 2021/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label:UILabel!
    @IBOutlet var hanteilabel:UILabel!
        
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        if 9.8 <= count && count <= 10.2{
            hanteilabel.text = "PERFECT"
            hanteilabel.textColor = UIColor.red
        }else if 9.7 <= count && count <= 10.3{
            hanteilabel.text = "GREAT"
            hanteilabel.textColor = UIColor.orange
        }else if 9.5 <= count && count <= 10.5{
            hanteilabel.text = "GOOD"
            hanteilabel.textColor = UIColor.green
        }else{
            hanteilabel.text = "BAD"
            hanteilabel.textColor = UIColor.blue
        }
    }

    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector:#selector(self.up),
                                         userInfo:nil,
                                         repeats: true
            )
        }
    }

    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
            self.hantei()
        }
        
    }
    
    @IBAction func reset(){
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.0
        label.text = "0.0"
        hanteilabel.text = ""
    }
}


