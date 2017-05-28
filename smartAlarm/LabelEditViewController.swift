//
//  LabelEditViewController.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/29/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit

class LabelEditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var labelTextField: UITextField!
    var label: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
        self.labelTextField.delegate = self
        
        labelTextField.text = label
        
        //defined in UITextInputTraits protocol
        labelTextField.returnKeyType = UIReturnKeyType.done
        labelTextField.enablesReturnKeyAutomatically = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label = textField.text!
        performSegue(withIdentifier: Id.labelUnwindIdentifier, sender: self)
        //This method can be used when no state passing is needed
        //navigationController?.popViewController(animated: true)
        return false
    }
    
}

