//
//  HazardProfileViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class HazardProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var employeeID: UITextField!
    @IBOutlet var department: UITextField!
    @IBOutlet var supervisor: UITextField!
    
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
    
    @IBAction func saveInfo()
    {
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.hazProfileArray.append(firstName.text!)
        instanceOfGlobalArray.hazProfileArray.append(lastName.text!)
        instanceOfGlobalArray.hazProfileArray.append(employeeID.text!)
        instanceOfGlobalArray.hazProfileArray.append(department.text!)
        instanceOfGlobalArray.hazProfileArray.append(supervisor.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
