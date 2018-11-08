//
//  DetailViewController.swift
//  TABLEVIEW(2)_Delegate,Singleto,NotificationCenter_2
//
//  Created by Toan on 10/4/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit
/*
class theOneSingleton {
    static var shared : String?
    public init(){}
    
    func request() {
        print("Location granted")
    }
    
}
*/



class DetailViewController: UIViewController {
    
    @IBOutlet weak var Save: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    //var instance = theOneSingleton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Singleton.shared.stringg != nil {
            textField.text = Singleton.shared.stringg
        }
        
        //InAppSetting.shared.volumnOn = false
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Singleton.shared.stringg = textField.text
    }

//    @IBAction func goBack(sender: Any?) {
//        if let back =
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
