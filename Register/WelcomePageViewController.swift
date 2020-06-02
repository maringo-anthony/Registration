//
//  WelcomePageViewController.swift
//  clientRegistration
//
//  Created by Anthony MARINGO on 5/31/20.
//  Copyright © 2020 Anthony MARINGO. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIViewController {

    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let userEmail:String = userEmailTextField.text!
        let userFirst:String = userFirstNameTextField.text!
        let userLast:String = userLastNameTextField.text!
        
        // Check for empty fields
        if(userEmail.isEmpty  || userFirst.isEmpty || userLast.isEmpty){
            
            displayAlertMessage(userMessage: "Please fill in all fields")
            return
        }
        
    }
    
    // display alert
    func displayAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert,animated:true,completion:nil)
        
        
    }

}
