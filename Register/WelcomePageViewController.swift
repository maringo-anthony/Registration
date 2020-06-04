//
//  WelcomePageViewController.swift
//  clientRegistration
//
//  Created by Anthony MARINGO on 5/31/20.
//  Copyright © 2020 Anthony MARINGO. All rights reserved.
//

import UIKit
import FirebaseDatabase

class WelcomePageViewController: UIViewController {
    var ref: DatabaseReference!

    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        // If the user already entered data, put it in the field for when they come back
        if( UserDefaults.standard.string(forKey: "userFirst") != nil){
            userFirstNameTextField.text = UserDefaults.standard.string(forKey: "userFirst")
        }
        if(UserDefaults.standard.string(forKey: "userLast") != nil){
            userLastNameTextField.text = UserDefaults.standard.string(forKey: "userLast")
        }
        if(UserDefaults.standard.string(forKey: "userLast") != nil){
            userEmailTextField.text = UserDefaults.standard.string(forKey: "userEmail")
        }
        

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
        else{
            // save to userdefaults so we can just submit at the end
            UserDefaults.standard.set(userEmail,forKey: "userEmail")
            UserDefaults.standard.set(userFirst, forKey: "userFirst")
            UserDefaults.standard.set(userLast, forKey: "userLast")
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
