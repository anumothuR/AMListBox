//
//  ViewController.swift
//  AMListBox
//
//  Created by anumothuR on 04/01/2017.
//  Copyright (c) 2017 anumothuR. All rights reserved.
//

import AMListBox
import UIKit

class ViewController : UIViewController{


    @IBOutlet weak var lblDropdown: AMDropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        lblDropdown.listArray = ["Swift","Objective C","JAVA","Ruby"];
        lblDropdown.presentController = self
        lblDropdown.loadView()
        lblDropdown.pageTitle = "Select Language"
        lblDropdown.titleColor = UIColor.white
        lblDropdown.titleFont = UIFont.systemFont(ofSize: 11)
        lblDropdown.bgColor = UIColor.green
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

