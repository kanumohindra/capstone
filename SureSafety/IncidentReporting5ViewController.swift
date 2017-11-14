//
//  IncidentReporting5ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentReporting5ViewController: UIViewController {
    
    @IBOutlet var medYes: UIButton!
    @IBOutlet var medNo: UIButton!
    @IBOutlet var medUnknown: UIButton!
    
    @IBOutlet var txtTreatedOn: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        medYes.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        medYes.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        medNo.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        medNo.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        medUnknown.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        medUnknown.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func medYes(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            medNo.isEnabled = false
            txtTreatedOn.isEnabled = true
            datePicker.isHidden = false
        }
        else
        {
            medNo.isEnabled = true
        }
    }
    
    @IBAction func medNo(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            medYes.isEnabled = false
            txtTreatedOn.isEnabled = false
            datePicker.isHidden = true
        }
        else
        {
            medYes.isEnabled = true
        }
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        
        txtTreatedOn.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        txtTreatedOn.text = somedateString
        
        
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