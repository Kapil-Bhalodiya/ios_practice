//
//  customTVC.swift
//  demo_tableview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class customTVC: UIViewController {

    private let mycustomTVC = UITableView()
        private var cityArray = ["berlin","moscow","rio","denver","tokyo","Nairobi","helsinki","oslo"]
        //return cityArray
   
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Custom Table View"
        view.addSubview(mycustomTVC)
        setupTableView()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mycustomTVC.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width + 30, height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }

}
extension customTVC : UITableViewDataSource,UITableViewDelegate{
    
    private func setupTableView(){
        mycustomTVC.dataSource = self
        mycustomTVC.delegate = self
        mycustomTVC.register(CityCell.self, forCellReuseIdentifier: "CityCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.setUpCityCell(title: cityArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
