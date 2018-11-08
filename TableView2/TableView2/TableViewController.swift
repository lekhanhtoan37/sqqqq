//
//  UITableViewController.swift
//  TableView2
//
//  Created by Toan on 8/21/18.
//  Copyright © 2018 Toan123. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var noDataView: UIView!
    @IBOutlet weak var footerView: UIView!
    var hasNodata: Bool = true {
        didSet {
           tableView.tableFooterView = hasNodata ? noDataView : footerView
        }
    }
    // var number = ["2","1"]
    var arrayString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5{
            arrayString.append("\(i)")
        }
        
        //        for i in 0..<number.count - 1 {
        //            for j in i+1..<number.count {
        //                if number[i] < number[j]{
        //                    number.swapAt(j, i)
        //                }
        //            }
        //        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//      tableView.tableFooterView = footerView
        hasNodata = arrayString.count == 0
    }
    
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayString.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(arrayString[indexPath.row])
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if arrayString.count == 0 {
                tableView.tableFooterView = noDataView
                hasNodata = arrayString.count == 0
            }
        }
    }

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow  {
            if let detailViewController = segue.destination as? ViewController {
                detailViewController.name = String(arrayString[indexPath.row])
            }
        }
    }
    
    @IBAction func unwind (_ sender : UIStoryboardSegue)
    {
        
        let detailViewController = sender.source as? ViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            arrayString[indexPath.row] = detailViewController?.name ?? ""
        }
        else  {
            if arrayString.count == 0 {
                
                tableView.tableFooterView = noDataView
                
            }
            else{
                tableView.tableFooterView = footerView
            }

            
            arrayString.append(detailViewController?.name ?? "")
            
        }
        tableView.reloadData()
    }
    
}





