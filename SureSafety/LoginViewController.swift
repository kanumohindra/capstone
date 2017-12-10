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
    var actualUser = ""
    var actualPass = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passBox.isSecureTextEntry = true;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func authUser(sender: UIButton)
    {
        print("authUser ran successfully")
        readFromDatabase()
        if userBox.text == actualUser && passBox.text == actualPass
        {
            performSegue(withIdentifier: "AuthSeg", sender: UIButton())
        }
        else
        {
            print("Invalid Authentication")
            let alert = UIAlertController(title: "Alert", message: "Authentication failed", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    /*func createDatabase()
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("SureSafety.db")
        
        // open database
        
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
    }*/
    
    func readFromDatabase()
    {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("SureSafety.db")
        
        // open database
        
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, "select username, password from Login", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            
            if let cString = sqlite3_column_text(statement, 0) {
                let user = String(cString: cString)
                print("username = \(user)")
                actualUser = user
            } else {
                print("username not found")
            }
            
            /*let user = sqlite3_column_int64(statement, 0)
            print("username = \(user); ", terminator: "")*/
            
            if let cString = sqlite3_column_text(statement, 1) {
                let pass = String(cString: cString)
                print("password = \(pass)")
                actualPass = pass
            } else {
                print("password not found")
            }
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        
        statement = nil
        
        if sqlite3_close(db) != SQLITE_OK {
            print("error closing database")
        }
        
        db = nil
        
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
