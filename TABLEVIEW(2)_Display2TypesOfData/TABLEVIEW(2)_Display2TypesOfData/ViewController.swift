//
//  ViewController.swift
//  TABLEVIEW(2)_Display2TypesOfData
//
//  Created by Toan on 9/24/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlet
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var Save: UIButton!
    // Initial variable
    
    var detail : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (detail != nil)
        {
            textField.text = detail
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        detail = textField.text
    }
    


}

