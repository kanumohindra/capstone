//
//  IncidentReporting3ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentReporting3ViewController: UIViewController {
    
    @IBOutlet var view1: UITextView!
    @IBOutlet var view2: UITextView!
    @IBOutlet var name: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var email: UITextField!
    
    var witness: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveInfo()
    {
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.incReporting3.append(view1.text!)
        instanceOfGlobalArray.incReporting3.append(view2.text!)
        instanceOfGlobalArray.incReporting3.append(name.text!)
        instanceOfGlobalArray.incReporting3.append(phone.text!)
        instanceOfGlobalArray.incReporting3.append(email.text!)
    }
    
    @IBAction func AddAnotherWitnessBtn(_ sender: UIButton)
    {
        witness.append(name.text!)
        witness.append(phone.text!)
        witness.append(email.text!)
        
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.incReporting3.append(view1.text!)
        instanceOfGlobalArray.incReporting3.append(view2.text!)
        instanceOfGlobalArray.incReporting3.append(name.text!)
        instanceOfGlobalArray.incReporting3.append(phone.text!)
        instanceOfGlobalArray.incReporting3.append(email.text!)
        
        let alert = UIAlertController(title: "Witness Saved", message: "Please enter next witness.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        name.text = ""
        phone.text = ""
        email.text = ""
        
        
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
