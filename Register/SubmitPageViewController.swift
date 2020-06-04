//
//  SubmitPageViewController.swift
//  Register
//
//  Created by Anthony MARINGO on 6/4/20.
//  Copyright © 2020 Anthony MARINGO. All rights reserved.
//

import UIKit
import Firebase

class SubmitPageViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true);

        
        ref = Database.database().reference()
        
    }
    
    
    // display alert
    func displayAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert,animated:true,completion:nil)
        
        
    }
    
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        displayAlertMessage(userMessage: "Thank you!")
        
        // Put all of the defaults into the database
        
        let info = [
            "First":UserDefaults.standard.string(forKey: "userFirst"),
            "Last":UserDefaults.standard.string(forKey: "userLast"),
            "Email":UserDefaults.standard.string(forKey: "userEmail"),
            "Phone":UserDefaults.standard.string(forKey: "userPhone"),
            "Address":UserDefaults.standard.string(forKey: "userAddress"),
            "City":UserDefaults.standard.string(forKey: "userCity"),
            "Zip Code":UserDefaults.standard.string(forKey: "userZip")
        ]
        
        ref.child("Clients").childByAutoId().setValue(info)
        
        
        // After putting in database, clear data from device
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        
        return
    }
}
