//
//  IncidentProfileViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentProfileViewController: UIViewController /*UITableViewDelegate*/ /*UITableViewDataSource*/ {
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var employeeID: UITextField!
    @IBOutlet var department: UITextField!
    @IBOutlet var supervisor: UITextField!
    
    var supervisors: [String] = []
    var departments: [String] = []
    
    
    var info: [String] = []
    
    
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell
            ?? SiteCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let hazard = hazards[indexPath.row]
        tableCell.departmentName.text = hazard
        
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hazards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let currentCell = myTableView.cellForRow(at: indexPath) as! SiteCell
        txt1.text?.append(currentCell.departmentName.text! + ", ")
        
        /*myTableView.dataSource = nil
         myTableView.delegate = nil
         
         myTableView.isHidden = true*/
        
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*if info.isEmpty
        {
            
        }
        else
        {
            populateFields()
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveInfo()
    {
        info.append(firstName.text!)
        info.append(lastName.text!)
        info.append(employeeID.text!)
        info.append(department.text!)
        info.append(supervisor.text!)
        print(info[3])
        
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.incProfileArray.append(firstName.text!)
        instanceOfGlobalArray.incProfileArray.append(lastName.text!)
        instanceOfGlobalArray.incProfileArray.append(employeeID.text!)
        instanceOfGlobalArray.incProfileArray.append(department.text!)
        instanceOfGlobalArray.incProfileArray.append(supervisor.text!)
        
        print(instanceOfGlobalArray.incProfileArray[0])
        
    }
    
    @IBAction func populateFields()
    {
        //let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        firstName.text = info[0]
        lastName.text = info[1]
        employeeID.text = info[2]
        department.text = info[3]
        supervisor.text = info[4]
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
