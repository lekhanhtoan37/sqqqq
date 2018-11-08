//
//  TableTableViewController.swift
//  TABLEVIEW(2)_Display2TypesOfData
//
//  Created by Toan on 9/24/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // Initial porperty
    
    @IBOutlet var noDataView: UIView!
    
    @IBOutlet weak var switchItem: UISwitch!
    
    @IBOutlet weak var footerView: UIView!
    // Int type
    var dataIntSource = dataInt()
    // String type
    var dataStringSource = dataString()
    
    var hasNoData: Bool = true {
        didSet {
            tableView.tableFooterView = hasNoData ? noDataView : footerView
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataIntSource
        dataIntSource.mainInt = self
        dataStringSource.mainString = self
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hasNoData = switchItem.isOn ? (dataIntSource.numbers.count == 0 ) : ( dataStringSource.stringg.count == 0)
        tableView.reloadData()
    }

    
    @IBAction func switchAction (_ sender : UISwitch){
        // Present NODATA
        // hasNoData = dataIntSource.numbers.count == 0
        hasNoData = sender.isOn ? (dataIntSource.numbers.count == 0) : (dataStringSource.stringg.count == 0)
        // Show 2 types by SwitchItem
        tableView.dataSource = sender.isOn ? dataIntSource : dataStringSource
        
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
       if let indexPath = tableView.indexPathForSelectedRow {
            if let tableVC = segue.destination as? ViewController {
                tableVC.detail = switchItem.isOn ? String(dataIntSource.numbers[indexPath.row]) : dataStringSource.stringg[indexPath.row]
            }
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        if let tableVC = sender.source as? ViewController {
            if let indexPath = tableView.indexPathForSelectedRow {

                switchItem.isOn ? (dataIntSource.numbers[indexPath.row] = Int(tableVC.detail ?? "") ?? 0) : (dataStringSource.stringg[indexPath.row] = tableVC.detail ?? "")
            } else {
                
                switchItem.isOn ? (dataIntSource.numbers.append(Int(tableVC.detail ?? "") ?? 0)) : (dataStringSource.stringg.append(tableVC.detail ?? ""))
            }
        }
        tableView.reloadData()
    }
    
    
    
}

