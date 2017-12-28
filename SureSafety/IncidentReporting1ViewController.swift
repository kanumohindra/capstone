//
//  IncidentReporting1ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-10-25.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentReporting1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var dateBox: UITextField!
    @IBOutlet var timeBox: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var reportedTo: UITextField!
    @IBOutlet var location: UITextField!
    @IBOutlet var expTxt: UITextField!
    
    @IBOutlet var myTableView: UITableView!
    
    var exposures = ["Agression", "Assault", "Client Behaviour", "Environmental Condition", "Fall", "Fire/Explosion", "Harmful Substances", "Keyboarding", "Lift/Transfer - Object", "Lift/Transfer - Person", "Motor Vehicle Accident", "Needle Stick", "Other", "Overexertion", "Push/Pull", "Repetition", "Slip/Trip", "Stress - Cumulative", "Stress - Traumatic", "Struck By Person/Client - Intentional", "Struck By Person/Client - Unintentional", "Struck/Caught - By Object"]
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell
            ?? SiteCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let exposure = exposures[indexPath.row]
        tableCell.departmentName.text = exposure
        
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exposures.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let currentCell = myTableView.cellForRow(at: indexPath) as! SiteCell
        expTxt.text?.append(currentCell.departmentName.text! + ", ")
        
        /*myTableView.dataSource = nil
         myTableView.delegate = nil
         
         myTableView.isHidden = true*/
        
    }
    
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
    
    @IBAction func saveInfo()
    {
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.incReporting1.append(dateBox.text!)
        instanceOfGlobalArray.incReporting1.append(timeBox.text!)
        instanceOfGlobalArray.incReporting1.append(reportedTo.text!)
        instanceOfGlobalArray.incReporting1.append(location.text!)
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
