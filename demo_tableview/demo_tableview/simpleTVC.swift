//
//  simpleTVC.swift
//  demo_tableview
//
//  Created by DCS on 29/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class simpleTVC: UIViewController {

    private let citytaleview = UITableView()
    
    private var cityArray = ["abBerlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(citytaleview)
        tableviewsetup()
    }
    
    func tableviewsetup(){
        citytaleview.dataSource = self
        citytaleview.delegate = self
        citytaleview.register(UITableViewCell.self, forCellReuseIdentifier: "CityCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        citytaleview.frame = CGRect(
            x: 0,
            y:view.safeAreaInsets.top,
            width: view.frame.size.width,
            height: view.frame.height - view.safeAreaInsets.top -
                view.safeAreaInsets.bottom
            )
    }
}
extension simpleTVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return cityArray.count
        }else{
            return cityArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            if indexPath.section == 0{
                    let cell =  tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
                    cell.textLabel?.text = cityArray[indexPath.row]
                    return cell
            }else{
                    let cell =  tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
                    cell.textLabel?.text = cityArray[indexPath.row]
                    return cell
            }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Section 1"
        }else if section == 1{
            return "Section 2"
        }else{
            return "Section 3"
        }
    }
}

