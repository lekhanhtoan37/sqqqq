//
//  ViewController.swift
//  TABLEVIEW(2)_Delegate,Singleton,NotificationCenter
//
//  Created by Toan on 9/27/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit


protocol SmartDelegate: class  {
    func updateData( dataDetail : String)
    
}

class ViewController: UIViewController {
    weak var delegate : SmartDelegate?
    
    
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    var stringg : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       if stringg != nil {
            textField.text = stringg
        }
        //var editButtonitem : UIBarButtonItem {}
        //self.navigationItem.leftBarButtonItem = self.editButtonItem

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender : Any?) {
//        stringg = textField.text
//    }
    
    @IBAction func goBack (_ sender : Any?)
    {
        
        delegate?.updateData(dataDetail: textField.text!)
        
//      
  dismiss(animated: true)
        navigationController?.popViewController(animated: true)
        
    }
    
    
}

