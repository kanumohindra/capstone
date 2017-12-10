//
//  IncidentReporting4ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentReporting4ViewController: UIViewController {
    
    @IBOutlet var firstAidBoxYes: UIButton!
    @IBOutlet var firstAidBoxNo: UIButton!
    @IBOutlet var absenceBoxYes: UIButton!
    @IBOutlet var absenceBoxNo: UIButton!
    @IBOutlet var absenceBoxUnknown: UIButton!
    
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPosition: UITextField!
    @IBOutlet var txtDayOff: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePicker2: UIDatePicker!
    
    @IBAction func saveInfo()
    {
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.incReporting4.append(txtDate.text!)
        instanceOfGlobalArray.incReporting4.append(txtName.text!)
        instanceOfGlobalArray.incReporting4.append(txtPosition.text!)
        instanceOfGlobalArray.incReporting4.append(txtDayOff.text!)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firstAidBoxYes.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        firstAidBoxYes.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        firstAidBoxNo.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        firstAidBoxNo.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        absenceBoxYes.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        absenceBoxYes.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        absenceBoxNo.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        absenceBoxNo.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        absenceBoxUnknown.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        absenceBoxUnknown.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstAidBoxYes(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            txtDate.isEnabled = true
            datePicker.isHidden = false
            txtName.isEnabled = true
            txtPosition.isEnabled = true
        }
        else
        {
            
        }
    }
    
    @IBAction func firstAidBoxNo(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            txtDate.isEnabled = false
            datePicker.isHidden = true
            txtName.isEnabled = false
            txtPosition.isEnabled = false
        }
        else
        {
            
        }
    }
    
    @IBAction func absenceBoxYes(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            txtDayOff.isEnabled = true
            datePicker2.isHidden = false
        }
        else
        {
            
        }
    }
    
    @IBAction func absenceBoxNo(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            txtDayOff.isEnabled = false
            datePicker2.isHidden = true
        }
        else
        {
            
        }
    }
    
    @IBAction func absenceBoxUnknown(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            
        }
        else
        {
            
        }
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        
        txtDate.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        txtDate.text = somedateString
        
        
    }
    
    @IBAction func datePicker2Changed(sender: UIDatePicker) {
        
        txtDayOff.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        txtDayOff.text = somedateString
        
        
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
