//
//  ViewController.swift
//  RefactorDelegateAndDatasource
//
//  Created by Toan on 9/13/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

//class text {
//    public var text : String!
//
//    func textBlank() -> String! {
//        return text
//    }
//}


class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var textForFill : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pop"
        // Do any additional setup after loading the view.
        
        if textForFill != nil {
            textField.text = textForFill
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension ViewController
{
   
    
    @IBAction func pop(_ sender : Any)
    {
        //let tvc = TableViewController()
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        textForFill = textField.text
        
    }
    
}



