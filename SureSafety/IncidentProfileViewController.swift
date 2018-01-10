//
//  IncidentProfileViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class IncidentProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var employeeID: UITextField!
    @IBOutlet var department: UITextField!
    @IBOutlet var supervisor: UITextField!
    
    var supervisors: [String] = []
    //var departments: [String] = []
    
    @IBOutlet weak var DepartmentTableView: UITableView!
    @IBOutlet weak var SupervisorTableView: UITableView!
    
    
    var departmentsArray = ["Finanace", "Human Resources", "Information Technology", "Research & Development", "Sales", "Purchasing", "Maintenance"]
    
    var supervisorsArray = ["Rehanna Nizrudin", "Sheikh Azaad", "Vidur Prakash", "Kanu Mohindra", "Derall Ebanks", "Vidhi Chadha", "Anthony Lionti"]
    
    var info: [String] = []
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        if (tableView .isEqual(DepartmentTableView)) {
            let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell
                ?? SiteCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            
            let department = departmentsArray[indexPath.row]
            tableCell.departmentName.text = department
            return tableCell
            
            
        }
            
        else
        {
            let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell
                ?? SiteCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            
            let supervisor = supervisorsArray[indexPath.row]
            tableCell.departmentName.text = supervisor
            return tableCell
        }
        
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView .isEqual(DepartmentTableView))
        {
            return departmentsArray.count
        }
            
        else
        {
            return supervisorsArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if (tableView .isEqual(DepartmentTableView))
        {
            return 40
        }
            
        else
        {
            return 40
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if (tableView .isEqual(DepartmentTableView))
        {
            //print("test")
            let currentCell = DepartmentTableView.cellForRow(at: indexPath) as! SiteCell
            department.text = currentCell.departmentName.text!
        }
            
        else if (tableView .isEqual(SupervisorTableView))
        {
            print("test2")
            let currentCell = SupervisorTableView.cellForRow(at: indexPath) as! SiteCell
            supervisor.text = currentCell.departmentName.text!
        }
        
    }
    
    
    
    

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
