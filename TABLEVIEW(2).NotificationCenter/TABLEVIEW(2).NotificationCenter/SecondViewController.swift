//
//  SecondViewController.swift
//  TABLEVIEW(2).NotificationCenter
//
//  Created by Toan on 10/29/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    var data : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if data != nil {
            textField.text = data
        }
        
    }
    
    
    @IBAction func tabToNotifyBack(_ sender : Any?){
        NotificationCenter.default.post(name: .key1, object: textField.text)
        navigationController?.popViewController(animated: true)

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

