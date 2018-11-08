//
//  Singleton.swift
//  TABLEVIEW(2)_Delegate,Singleto,NotificationCenter_2
//
//  Created by Toan on 10/8/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class Singleton {
    /*
    static var shared = InAppSetting()
    var volumnOn: Bool = false
    */
    static var shared = Singleton()
    private init(){
        
    }
    var stringg : String!
    

}

