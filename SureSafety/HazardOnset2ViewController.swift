//
//  HazardOnset2ViewController.swift
//  SureSafety
//
//  Created by Xcode User on 2017-11-01.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class HazardOnset2ViewController: UIViewController {
    
    @IBOutlet var resolvedYes: UIButton!
    @IBOutlet var resolvedNo: UIButton!
    @IBOutlet var resolvedUnknown: UIButton!
    @IBOutlet var resolvedNA: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resolvedYes.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        resolvedYes.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        resolvedNo.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        resolvedNo.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        resolvedUnknown.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        resolvedUnknown.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
        
        resolvedNA.setBackgroundImage(UIImage(named: "unchecked.png"), for: .normal)
        resolvedNA.setBackgroundImage(UIImage(named: "checkbox-checked.png"), for: .selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resolvedYes(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            resolvedNo.isSelected = false
            resolvedUnknown.isSelected = false
            resolvedNA.isSelected = false
        }
        else
        {
            
        }
    }
    
    @IBAction func resolvedNo(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            resolvedYes.isSelected = false
            resolvedUnknown.isSelected = false
            resolvedNA.isSelected = false
        }
        else
        {
            
        }
    }
    
    @IBAction func resolvedUnknown(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            resolvedNo.isSelected = false
            resolvedYes.isSelected = false
            resolvedNA.isSelected = false
        }
        else
        {
            
        }
    }
    
    @IBAction func resolvedNA(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            resolvedNo.isSelected = false
            resolvedUnknown.isSelected = false
            resolvedYes.isSelected = false
        }
        else
        {
            
        }
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
