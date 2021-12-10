//
//  Employee.swift
//  CRUD_Notes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class Employee {

    var id:Int  = 0
    var name:String = ""
    var age:Int = 0
    var phone:String = ""

    init(id:Int,name:String,age:Int,phone:String) {
        self.id = id
        self.name = name
        self.age = age
        self.phone = phone
    }
}
