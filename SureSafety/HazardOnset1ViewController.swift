//
//  HazardOnset1ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class HazardOnset1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var view1: UITextView!
    @IBOutlet var view2: UITextView!
    @IBOutlet var txt1: UITextField!
    var hazards = ["Agression", "Environmental Condition", "Fall", "Fire/Explosion", "Harmful Substance", "Keyboarding", "Lift/Transfer - Object", "Lift/Transfer - Person", "Needle Stick", "Overexertion", "Push/Pull", "Repetition", "Slip/Trip", "Stress - Cumulative", "Stress - Traumatic", "Struck by Object", "Struck by Person/Client - Intentional", "Struck by Person/Client - Unintentional"]
    
    @IBOutlet var myTableView: UITableView!
    
    @IBAction func saveInfo()
    {
        let instanceOfGlobalArray: GlobalArray = GlobalArray()
        
        instanceOfGlobalArray.hazOnset.append(view1.text!)
        instanceOfGlobalArray.hazOnset.append(view2.text!)
        instanceOfGlobalArray.hazOnset.append(txt1.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*hazards.append("lol")
        hazards.append("lol2")*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
