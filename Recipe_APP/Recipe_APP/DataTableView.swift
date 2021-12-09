//
//  DataTableView.swift
//  Recipe_APP
//
//  Created by DCS on 04/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DataTableView: UIViewController {
    private let tblView = UITableView()
    private let titleNameArray = ["American Burger","Healthy Burger","4 Cheese Pizza","Chinese"]
    private let contentAray = ["Lorem Ipsum has been the industry's standard dummy text","Lorem Ipsum has been the industry's standard dummy text","Lorem Ipsum has been the industry's standard dummy text","Lorem Ipsum has been the industry's standard dummy text"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tblView)
        setupData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tblView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
}
extension DataTableView:UITableViewDelegate,UITableViewDataSource{
    
    private func setupData(){
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(DataCell.self, forCellReuseIdentifier: "Data")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Data", for: indexPath) as! DataCell
        cell.setUpDataCell(title: titleNameArray[indexPath.row],content: contentAray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.setValue(titleNameArray[indexPath.row], forKey: "listname")
        let cs = DetailScreen()
        navigationController?.pushViewController(cs, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
