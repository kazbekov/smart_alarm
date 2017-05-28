//
//  MediaViewController.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/29/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaViewController: UITableViewController  {
    
    fileprivate let numberOfRingtones = 2
    var mediaLabel: String!
    var mediaID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        performSegue(withIdentifier: Id.soundUnwindIdentifier, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor =  UIColor.gray
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .left
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return numberOfRingtones
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "RINGTONS"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Id.musicIdentifier)
        if(cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default, reuseIdentifier: Id.musicIdentifier)
        }
        if indexPath.row == 0 {
            cell!.textLabel!.text = "bell"
        }
        else if indexPath.row == 1 {
            cell!.textLabel!.text = "tickle"
        }
        
        if cell!.textLabel!.text == mediaLabel {
            cell!.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        mediaLabel = cell?.textLabel?.text!
        cell?.setSelected(true, animated: true)
        cell?.setSelected(false, animated: true)
        let cells = tableView.visibleCells
        for c in cells {
            let section = tableView.indexPath(for: c)?.section
            if (section == indexPath.section && c != cell) {
                c.accessoryType = UITableViewCellAccessoryType.none
            }
        }
        
    }
}
