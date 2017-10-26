//
//  IncidentReporting1ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-10-25.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentReporting1ViewController: UIViewController {
    
    @IBOutlet var dateBox: UITextField!
    @IBOutlet var timeBox: UITextField!
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        
        dateBox.text = ""
        timeBox.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        
        dateBox.text = somedateString
        
        let picker = sender
        //picker.datePickerMode = .time
        
        let date = picker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        timeBox.text = String(hour) + ":" + String(minute)
        
        
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
