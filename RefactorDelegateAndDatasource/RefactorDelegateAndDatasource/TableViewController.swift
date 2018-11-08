//
//  TableViewController.swift
//  RefactorDelegateAndDatasource
//
//  Created by Toan on 9/13/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class IceCreamStore
{
    public var flavor = ["Vanilla", "Chocolate", "Strawberry", "Coffee", "Cookies & Cream", "Rum Raisins", "Mint Chocolate Chip", "Peanut Butter Cup"]
    
    func allFlavours() -> [String]
    {
        return flavor
    }
    
}


class ID {
    
    var id = [Int]()
    
    
    func allID() -> [Int] {
        for i in 1...8 {
            id.append(i)
        }
        return id
    }
}

//class total {
//    var total = [String]()
//
//    func totalDetail() -> [String] {
//        return total
//    }
//}



class TableViewController: UITableViewController {

    //MARK :  - View cycle
    
    @IBOutlet var noDataView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var Add: UIBarButtonItem!
    @IBOutlet weak var switchItem: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.backBarButtonItem = Add
    }
    
    //Mark : - Tableview data source
}

class noData{
    var noData : Bool = true
        
    func noDataView() -> Bool {
        return tableView.tableFooterView
    }
    
    
}

extension noData {
    var noDataView : noData {
        didSet {
            tableView.tableFooterView = hasNoData ? noDataView : footerView
        }
    }
}



extension TableViewController
{
    
    var dataStore: IceCreamStore
    {
        return IceCreamStore()
        
    }
    
    var idShow: ID
    {
        return ID()
    }

//    var total: total
//    {
//        return ID() + IceCreamStore()
//
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataStore.allFlavours().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let flavor = dataStore.allFlavours()[indexPath.row]
        
        let count = idShow.allID()[indexPath.row]
        
        let total = "\(count)" + ". " + flavor
        
        cell.textLabel?.text = total
        return cell
    }
    
    override func tableView(_ tableview: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataStore.flavor.remove(at: indexPath.row)
            tableview.deleteRows(at: [indexPath], with: .fade)
//            if dataStore.allFlavours().count == 0 {
//                tableview.tableFooterView = (nil)
//
//            }
            
        }
    }

    
    @IBAction func PushToViewController (_ sender : Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "viewcontroller")
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            if let tableViewController = segue.destination as? ViewController {
                tableViewController.textForFill.text = dataStore.allFlavours()[indexPath.row]
                
            }
        }
    }
    
    
    
}



