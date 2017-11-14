//
//  OnSetOfIncidentViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-10-25.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class OnSetOfIncidentViewController: UIViewController {
    
    @IBOutlet var btn_box: UIButton!
    @IBOutlet var btn_box2: UIButton!
    @IBOutlet var suddenDateBox: UITextField!
    @IBOutlet var suddenTimeBox: UITextField!
    @IBOutlet var suddenDatePicker: UIDatePicker!
    @IBOutlet var gradStartDate: UITextField!
    @IBOutlet var gradEndDate: UITextField!
    @IBOutlet var gradStartDatePicker: UIDatePicker!
    @IBOutlet var gradEndDatePicker: UIDatePicker!
    
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblStart: UILabel!
    @IBOutlet var lblEnd: UILabel!
    
    @IBOutlet var lblSuddenTitle: UILabel!
    @IBOutlet var lblGradTitle: UILabel!
    
    static var localTimeZoneAbbreviation: String { return  NSTimeZone.local.abbreviation(for: Date())! }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        suddenDateBox.isHidden = true
        suddenTimeBox.isHidden = true
        suddenDatePicker.isHidden = true
        gradStartDate.isHidden = true
        gradEndDate.isHidden = true
        gradStartDatePicker.isHidden = true
        gradEndDatePicker.isHidden = true
        lblDate.isHidden = true
        lblTime.isHidden = true
        lblStart.isHidden = true
        lblEnd.isHidden = true
        
        
        btn_box.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        btn_box.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        btn_box2.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        btn_box2.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
    }
    
    @IBAction func btn_box(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        //let seconds = calendar.component(.second, from: date)
        
        
        
        if sender.isSelected{
            suddenTimeBox.text = String(hour) + ":" + String(minute)
            suddenDateBox.text = result
            lblGradTitle.isHidden = true
            btn_box2.isHidden = true
            suddenDateBox.isHidden = false
            suddenTimeBox.isHidden = false
            suddenDatePicker.isHidden = false
            lblDate.isHidden = false
            lblTime.isHidden = false
        }
        else
        {
            lblGradTitle.isHidden = false
            btn_box2.isHidden = false
            suddenDateBox.isHidden = true
            suddenTimeBox.isHidden = true
            suddenDatePicker.isHidden = true
            lblDate.isHidden = true
            lblTime.isHidden = true
        }
    }
    
    @IBAction func btn_box2(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            lblSuddenTitle.isHidden = true
            btn_box.isHidden = true
            gradStartDate.isHidden = false
            gradEndDate.isHidden = false
            gradStartDatePicker.isHidden = false
            gradEndDatePicker.isHidden = false
            lblStart.isHidden = false
            lblEnd.isHidden = false
        }
        else
        {
            lblSuddenTitle.isHidden = false
            btn_box.isHidden = false
            gradStartDate.isHidden = true
            gradEndDate.isHidden = true
            gradStartDatePicker.isHidden = true
            gradEndDatePicker.isHidden = true
            lblStart.isHidden = true
            lblEnd.isHidden = true
        }
    }
    
    
    @IBAction func suddenDatePickerChanged(sender: UIDatePicker) {
        
        suddenDateBox.text = ""
        suddenTimeBox.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        suddenDateBox.text = somedateString
        
        let picker = sender
        //picker.datePickerMode = .time
        
        let date = picker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        suddenTimeBox.text = String(hour) + ":" + String(minute)
        
        
    }
    
    @IBAction func gradStartDatePickerChanged(sender: UIDatePicker) {
        
        gradStartDate.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        gradStartDate.text = somedateString
    }
    
    @IBAction func gradEndDatePickerChanged(sender: UIDatePicker) {
        
        gradEndDate.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        gradEndDate.text = somedateString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
