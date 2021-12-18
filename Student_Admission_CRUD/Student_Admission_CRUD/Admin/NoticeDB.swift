//
//  NoticeDB.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 15/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class NoticeDB {
    var id : Int = 0
    var title : String = ""
    var desc : String = ""
    var div : String = ""
    var don : String = ""
    
    
    init(id:Int,title:String,desc:String,div:String,don:String) {
        self.id = id
        self.title = title
        self.desc = desc
        self.div = div
        self.don = don
    }
}
