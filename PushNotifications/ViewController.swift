//
//  ViewController.swift
//  PushNotifications
//
//  Created by Ivan Lopez Ansaldo on 11/13/17.
//  Copyright © 2017 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label_pmam: UILabel!
    @IBOutlet weak var label_time: UILabel!
    
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateClock()
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(ViewController.updateClock), userInfo: nil, repeats: true)
    }

    @objc func updateClock(){
        let date = Date()
        let calendar = Calendar.current
        let requestedComponents : NSCalendar.Unit = [NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        let components = (calendar as NSCalendar).components(requestedComponents, from: date)
        var hour = components.hour
        let minute = components.minute
        
        if hour! > 12{
            hour = hour! - 12
            label_pmam.text = "PM"
        }else{
            label_pmam.text = "AM"
        }
        
        label_time.text = padZero(hour!) + ":" + padZero(minute!)
        
    }

    func padZero(_ numb : Int) -> String{
        let numb2 = (numb < 10 ? "0" : "") + String(numb)
        return numb2
    }
}

