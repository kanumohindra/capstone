//
//  LoginViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-14.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userBox: UITextField!
    @IBOutlet var passBox: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func authUser(sender: UIButton)
    {
        let instanceofAppDelegate: AppDelegate = AppDelegate()
        let instanceofLoginData: LoginData = LoginData()
        
        
        instanceofAppDelegate.readDataFromDatabase()
        
        if userBox.text == instanceofLoginData.username && passBox.text == instanceofLoginData.password
        {
            print("lol")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
