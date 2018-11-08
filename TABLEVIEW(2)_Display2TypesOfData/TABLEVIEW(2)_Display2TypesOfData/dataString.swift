//
//  dataString.swift
//  TABLEVIEW(2)_Display2TypesOfData
//
//  Created by Toan on 9/24/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class dataString: NSObject, UITableViewDataSource {
    var stringg = [String](arrayLiteral: "a","b","c")
    
    var mainString: TableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(stringg[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stringg.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            mainString?.hasNoData = (stringg.count == 0)
        }
        tableView.reloadData()
    }

}
