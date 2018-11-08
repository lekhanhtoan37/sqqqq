//
//  ViewController.swift
//  TABLEVIEW(2).NotificationCenter
//
//  Created by Toan on 10/27/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit
extension Notification.Name{
    static let key1 = Notification.Name("2")
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    //static let key = Notification.Name("myNotificationKey")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        NotificationCenter.default.addObserver(self, selector:  #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)        
        registerNotification()
//        handleNotification( _ notification: Notification)
        
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .key1 , object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc
    func handleNotification(_ notification: Notification) {
        if let object1 = (notification.object as? String) {
            label.text = object1
        }
    }
    //@IBAction func push(_ sender : UIButton) {
//        let _ = self.navigationController?.pushViewController(SecondViewController(), animated: true)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let object = segue.destination as? SecondViewController {
            object.data = label.text
        }
    }

    

}


