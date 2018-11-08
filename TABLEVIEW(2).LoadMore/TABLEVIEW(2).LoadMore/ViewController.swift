//
//  ViewController.swift
//  TABLEVIEW(2).LoadMore
//
//  Created by Toan on 11/3/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
//    @IBOutlet weak var tableFooterView: UIView!
//    
//
//    @IBOutlet var noData: UIView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if ( cell == nil ) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = "Row \(arrayList[indexPath.row])"
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var index = 0
        while index < limit {
            arrayList.append(index)
            index = index + 1
        }
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.tableFooterView = noData
//    }
    var limit = 5
    let totalNumbers = 100
    
    var arrayList : [Int] = Array()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell{
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        if ( cell == nil ) {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//        cell.textLabel?.text = "Row \(arrayList[indexPath.row])"
//        return cell
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == arrayList.count - 1
        {
             //load more at last cell
            if arrayList.count < totalNumbers {
                // make condition to pending
                var counter = arrayList.count
                limit = counter // + 1
                while counter < limit {
                    arrayList.append(counter)
                    //counter = counter // + 1

                }
                self.perform(#selector(loadTableView), with: nil, afterDelay: 1.0)
            }
        }
    }
        @objc func loadTableView() {
            self.tableView.reloadData()
    }
    
    
    
    

    
    


}

