//
//  simpleTVC.swift
//  tableViewPractice
//
//  Created by DCS on 01/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class simpleTVC: UIViewController {
    
    private let tblview = UITableView()
    private let nameArray = ["India","AUS","NZ","SL","WD","PAK","ENG"
    ];
     private var cityArray = ["berlin","moscow","rio","denver","tokyo","Nairobi","helsinki"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tblview)
        tblViewSetup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tblview.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    
}
extension simpleTVC:UITableViewDelegate,UITableViewDataSource {
    func tblViewSetup(){
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(TableViewCell.self, forCellReuseIdentifier: "NameCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! TableViewCell
        cell.setUpData(title: nameArray[indexPath.row],stitle: cityArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Countries"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

