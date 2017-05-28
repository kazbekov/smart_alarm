//
//  LeaderBoardTableViewController.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/30/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit

class RecordsTableViewController: UITableViewController {
    
    let backgroundImage = UIImage(named: "nightIcon")
    let defaults = UserDefaults.standard
    var leaderboard = [[String]]()
    let date = Date()
    let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboard = defaults.array(forKey: "leaderboard") as! [[String]]
        setNeeds()
        animateTable()
        
    }
    
    func setNeeds(){
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timertimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func timertimer(){
        let hour = calendar.component(.hour, from: date)
        if hour > 6 && hour < 18 {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "dayIcon"))
            self.tableView.backgroundView = imageView
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = imageView.bounds
            imageView.addSubview(blurView)
        } else {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "nightIcon"))
            self.tableView.backgroundView = imageView
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = imageView.bounds
            imageView.addSubview(blurView)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboard.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameTableViewCell
        cell.nameCell?.text = leaderboard[indexPath.row][0]
        cell.scoreCell!.text = leaderboard[indexPath.row][1]
        return cell
    }
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: GameTableViewCell = i as! GameTableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            
        }
        
        var index = 0
        
        for a in cells {
            let cell: GameTableViewCell = a as! GameTableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    
    
    
}
