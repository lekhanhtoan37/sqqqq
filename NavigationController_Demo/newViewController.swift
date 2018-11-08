//
//  newViewController.swift
//  NavigationController_Demo
//
//  Created by Son on 8/8/18.
//  Copyright © 2018 NguyenHoangSon. All rights reserved.
//

import UIKit

class newViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pop"
        self.navigationItem.prompt = "Promt"
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Pop(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
