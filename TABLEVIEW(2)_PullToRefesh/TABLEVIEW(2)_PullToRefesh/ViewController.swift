//
//  ViewController.swift
//  TABLEVIEW(2)_PullToRefesh
//
//  Created by Toan on 10/31/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    var arrayNumbers = [Int](1...3)
    var number = 4
    
    override func viewDidLoad() {
//Add Refresh Control to Table View
        super.viewDidLoad()
        number = arrayNumbers.count
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 12.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
        refresh()
        print(arrayNumbers)
// Customizing Refresh Control
        self.refreshControl.tintColor = UIColor.red
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data...", attributes: attributes)
        
    }
//      Setup Refresh Control
    func refresh () {
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
    }
    @objc
    private func updateData() {
        number += 1

        arrayNumbers.append(number)
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arrayNumbers[indexPath.row])
        return cell
    }
    
    
}

