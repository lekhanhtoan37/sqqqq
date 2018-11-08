//
//  ViewController.swift
//  TABLEVIEW(2)_Delegate,Singleto,NotificationCenter_2
//
//  Created by Toan on 10/4/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit
/*
 
class NetworkManager {
    static let shared = NetworkManager(baseURL: API_TO_BE_DEPRECATED.baseURL)
    
    let baseURL: URL
    
    private init(baseURL :URL) {
        self.baseURL = baseURL
    
    }
}
***
class theOneSingleton {
    class var sharedInstance: theOneSingleton {
        struct Static {
            static var oneToken: dispatch_time_t = 0
            static var instance: theOneSingleton? = nil
            
        }
        dispatch_time(Static.oneToken) {
            Static.instance = theOneSingleton()
        }
        
        return Static.instance!
    }
    
    
}
*/




class MasterViewController: UIViewController{

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DVC = segue.destination as? DetailViewController {
            Singleton.shared.stringg = textLabel.text
        }
    }
    @IBAction func goBack(_ sender : UIStoryboardSegue?)
    {
        if let DVC = sender?.source as? DetailViewController {
            textLabel.text = Singleton.shared.stringg
        }
    }
    
}

