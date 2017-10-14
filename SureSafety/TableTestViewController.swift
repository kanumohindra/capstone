//
//  TableTestViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-10-14.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class TableTestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var departments = ["Human Resources", "Financial", "Health and Safety", "Research and Development"]
    
    @IBOutlet var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell
        ?? SiteCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let department = departments[indexPath.row]
        tableCell.departmentName.text = department
        
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = myTableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let currentCell = myTableView.cellForRow(at: indexPath!)! as! SiteCell
        
        print(currentCell.textLabel!.text ?? "test")
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ///myTableView.isHidden = false
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
