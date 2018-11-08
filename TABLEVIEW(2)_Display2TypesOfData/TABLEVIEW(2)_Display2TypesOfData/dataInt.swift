//
//  dataInt.swift
//  TABLEVIEW(2)_Display2TypesOfData
//
//  Created by Toan on 9/24/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class dataInt: NSObject, UITableViewDataSource {
    // Initial Int porperty
    
    
    var numbers = [Int](1...3)
    
    var mainInt : TableViewController?
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            mainInt?.hasNoData = (numbers.count == 0)
        }
        tableView.reloadData()
    }
    
    
}
