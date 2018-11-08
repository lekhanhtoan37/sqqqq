//
//  TableViewController.swift
//  TABLEVIEW(2)_Delegate,Singleton,NotificationCenter
//
//  Created by Toan on 9/27/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit
//  Tao Protocol SmartDelegate

class TableViewController: UITableViewController, SmartDelegate {
    //weak var delegate : SmartDelegate?
    
    @IBOutlet var noDataView: UIView!
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var addItem: UIBarButtonItem!
    var dataString = ["toan 1","toan 2"]
    
    var hasNoData : Bool = true {
        didSet {
            tableView.tableFooterView = hasNoData ? noDataView : footerView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if dataString.count == 0 {
            hasNoData = tableView.tableFooterView == noDataView
        }
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataString.count 
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataString[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // fill in
        dataString.remove(at: indexPath.row)
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
            if dataString.count == 0 {
                tableView.tableFooterView = noDataView
            }
            
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as? ViewController
            vc?.delegate = self
            if let indexPath = tableView.indexPathForSelectedRow {
                vc?.stringg = dataString[indexPath.row]
            }
        
    }
    
    func updateData(dataDetail: String) {
        tableView.tableFooterView = nil
        if let indexPath = tableView.indexPathForSelectedRow {
            dataString[indexPath.row] = dataDetail
            tableView.reloadData()
        } else {
            dataString.append(dataDetail)
            
        
           // tableView.reloadData()
    }
    

}
//}
//extension TableViewController {
////    @IBAction func goBack ( _ sender : UIBarButtonItem)
////    {
////        if sender == addItem {
////
////        }
////    }
//
//}
//
//extension SmartDelegate {
//
//
//
//}

}
