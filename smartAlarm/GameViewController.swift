//
//  GameViewController.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/29/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit
import Foundation

class GameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var textLabelOfColor: UILabel!
    @IBOutlet var colorLabelOfColor: UILabel!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var score: UILabel!
    @IBOutlet var timer: UILabel!
    
    var falses = 0
    var truses = 0
    var leaderboard = [[String]]()
    let date = Date()
    let calendar = Calendar.current
    
    let colorArray = [UIColor.black,UIColor.blue,UIColor.brown,UIColor.gray,UIColor.green,UIColor.magenta,UIColor.orange,UIColor.purple,UIColor.red,UIColor.yellow]
    let textArray = ["black","blue","brown","gray","green","magenta","orange","purple","red","yellow"]
    var textIndex: Int!
    var colorIndex: Int!
    var scorePlus = 0
    var timerCount = 200
    var timerToSliderImage = Timer()
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        setNeeds()
        leaderboard = defaults.array(forKey: "leaderboard") as! [[String]]
        textLabelOfColor.layer.cornerRadius = 10
        colorLabelOfColor.layer.cornerRadius = 10
        score.layer.cornerRadius = 20
        timer.layer.cornerRadius = 7
        timer.text = String(scorePlus)
        timerToSliderImage = Timer.scheduledTimer(timeInterval: 1,
                                                  target:self,
                                                  selector: #selector(GameViewController.timerRun),
                                                  userInfo: nil,
                                                  repeats: true)
        timerToSliderImage.fire()
        
    }
    
    func setNeeds(){
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timertimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func timertimer(){
        let hour = calendar.component(.hour, from: date)
        if hour > 6 && hour < 18 {
            backgroundImage.image = #imageLiteral(resourceName: "dayIcon")
        } else {
            backgroundImage.image = #imageLiteral(resourceName: "nightIcon")
        }
        
    }
    
    func timerRun(){
        timerCount = timerCount - 1
        timer.text = String(timerCount)
        if timerCount == 0 {
            guard let score = score.text else { return }
            let alert = UIAlertController(title: "Your score: \(score) \n Falses: \(falses) \n Truses: \(truses)", message: "Enter your name:", preferredStyle: .alert)
            
            alert.addTextField { (textField) in
                textField.placeholder = "Alima"
                textField.textAlignment = .center
            }
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0]
                guard let name = textField?.text else {return}
                self.performSegue(withIdentifier: "showRatingSegue", sender: nil)
                self.leaderboard.append(["\(name)", "\(score)"])
                self.defaults.set(self.leaderboard, forKey: "leaderboard")
            }))
            self.present(alert, animated: true, completion: nil)
            self.timerToSliderImage.invalidate()
        }
    }
    
    func addScore() -> Int{
        scorePlus = scorePlus + 10
        return scorePlus
    }
    
    func minusScore() -> Int{
        scorePlus = scorePlus - 5
        return scorePlus
    }
    
    func returnRandomNumber() -> Int{
        let random = Int(arc4random_uniform(UInt32(colorArray.count)))
        return random
    }
    
    func showQuestion(){
        textIndex = returnRandomNumber()
        colorIndex = returnRandomNumber()
        textLabelOfColor.text = textArray[textIndex]
        colorLabelOfColor.text = textArray[colorIndex]
        colorLabelOfColor.textColor = colorArray[colorIndex]
        toggleButtons(true)
        returnColors()
    }
    
    func toggleButtons(_ toggle: Bool ){
        yesButton.isUserInteractionEnabled = toggle
        noButton.isUserInteractionEnabled = toggle
    }
    
    
    func returnColors(){
        yesButton.backgroundColor = UIColor.white
        noButton.backgroundColor = UIColor.white
    }
    
    func clearButton(){
        yesButton.backgroundColor = UIColor.clear
        noButton.backgroundColor = UIColor.clear
    }
    
    @IBAction func yesAction(_ sender: UIButton) {
        toggleButtons(false)
        
        if textIndex == colorIndex {
            sender.backgroundColor = UIColor.green
            score.text = String(addScore())
            truses = truses + 1
            
        }else {
            score.text = String(minusScore())
            sender.backgroundColor = UIColor.red
            falses = falses + 1
        }
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameViewController.showQuestion), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func noAction(_ sender: UIButton) {
        toggleButtons(false)
        
        if textIndex == colorIndex {
            score.text = String(minusScore())
            sender.backgroundColor = UIColor.red
            falses = falses + 1
            
        }else{
            sender.backgroundColor = UIColor.green
            score.text = String(addScore())
            truses = truses + 1
        }
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameViewController.showQuestion), userInfo: nil, repeats: false)
        
    }
}
