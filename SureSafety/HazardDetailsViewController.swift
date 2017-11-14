//
//  HazardDetailsViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class HazardDetailsViewController: UIViewController {
    
    @IBOutlet var healthHazardBox: UIButton!
    @IBOutlet var safetyHazardBox: UIButton!
    @IBOutlet var workSiteBox: UIButton!
    @IBOutlet var offSiteBox: UIButton!
    
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtTime: UITextField!
    @IBOutlet var txtWorkSite: UITextField!
    @IBOutlet var txtOffSite: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        healthHazardBox.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        healthHazardBox.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        safetyHazardBox.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        safetyHazardBox.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        workSiteBox.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        workSiteBox.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        offSiteBox.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        offSiteBox.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func healthHazardBox(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            safetyHazardBox.isHidden = true
        }
        else
        {
            safetyHazardBox.isHidden = false
        }
    }
    
    @IBAction func safetyHazardBox(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            healthHazardBox.isHidden = true
        }
        else
        {
            healthHazardBox.isHidden = false
        }
    }
    
    
    @IBAction func workSiteBox(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            offSiteBox.isHidden = true
            txtOffSite.isEnabled = false
        }
        else
        {
            offSiteBox.isHidden = false
            txtOffSite.isEnabled = true
        }
    }
    
    @IBAction func offSiteBox(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            workSiteBox.isHidden = true
            txtWorkSite.isEnabled = false
        }
        else
        {
            workSiteBox.isHidden = false
            txtWorkSite.isEnabled = true
        }
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        
        txtDate.text = ""
        txtTime.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        txtDate.text = somedateString
        
        let picker = sender
        //picker.datePickerMode = .time
        
        let date = picker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        txtTime.text = String(hour) + ":" + String(minute)
        
        
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
