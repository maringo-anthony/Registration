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
            // send it to the fire base
            ref.child("Clients").childByAutoId().setValue("Hello")
            
            
            // save to userdefaults so we can just submit at the end
            UserDefaults.standard.set(userEmail,forKey: "userEmail")
            UserDefaults.standard.set(userFirst, forKey: "userFirst")
            UserDefaults.standard.set(userLast, forKey: "userLast")
            
            print("Printing array")
            print(UserDefaults.standard.dictionaryRepresentation().keys)
            
            // clear user defaults
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)

            
            print("Printing array")
            print(UserDefaults.standard.dictionaryRepresentation().keys)
            
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
