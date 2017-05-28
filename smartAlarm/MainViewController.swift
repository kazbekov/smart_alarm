//
//  ViewController.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/28/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate {
   
    @IBOutlet weak var SetupAlarmOutlet: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var labeladd = UILabel()
    let myDatePicker: UIDatePicker = UIDatePicker()
    let dateFormatter =  DateFormatter()
    var dateString = ""
    let date = Date()
    let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeeds()
        
    }
    
    func setNeeds(){
        SetupAlarmOutlet.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.5)
        SetupAlarmOutlet.layer.borderWidth = 1.0
        currentTimeLabel.font = UIFont(name: "OpenSans-Light", size: 60)
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerActivate), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func timerActivate(){
        dateFormatter.dateFormat = "HH:mm"
        dateString = dateFormatter.string(from: Date())
        currentTimeLabel.text = dateString
        let hour = calendar.component(.hour, from: date)
        if hour > 6 && hour < 18 {
            backgroundImageView.image = #imageLiteral(resourceName: "dayIcon")
            titleLabel.text = "Day"
        } else {
            backgroundImageView.image = #imageLiteral(resourceName: "nightIcon")
            titleLabel.text = "Night"
        }
    }
}

