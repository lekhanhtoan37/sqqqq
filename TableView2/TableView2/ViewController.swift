//
//  ViewController.swift
//  TableView2
//
//  Created by Toan on 8/21/18.
//  Copyright © 2018 Toan123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var textLabel: UITextField!
    
    var name : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if name != nil {
            textLabel.text = name
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = textLabel.text
    }

    


}

