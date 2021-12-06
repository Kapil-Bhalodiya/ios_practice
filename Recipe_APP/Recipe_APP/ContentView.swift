//
//  ContentView.swift
//  Recipe_APP
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ContentView: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        check()
    }

    private func check(){
        if let list_name = UserDefaults.standard.string(forKey: "listname"){
            print("listname is \(list_name)")
        }else{
            print("No Content")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
