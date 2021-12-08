//
//  DetailScreen.swift
//  Recipe_APP
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DetailScreen: UIViewController {
    private let tv = UITableView()
    private let steparray = ["Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options, that try to mimic a meat texture, to custom made black bean and veggie patties and more","Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options, that try to mimic a meat texture, to custom made black bean and veggie patties and more","Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options, that try to mimic a meat texture, to custom made black bean and veggie patties and more"]
    
    private let title1:UILabel = {
        let lbl = UILabel()
        lbl.text = UserDefaults.standard.string(forKey: "listname")
        lbl.font = UIFont.boldSystemFont(ofSize:20)
        return lbl
    }()
    
    private let myimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 05
        imgview.image = UIImage(named: ((UserDefaults.standard.string(forKey: "listname") ?? nil) ?? nil)!)
        imgview.clipsToBounds = true
        return imgview
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        view.addSubview(myimgview)
        view.addSubview(title1)
        view.addSubview(tv)
        tblViewSetup()
    }
    override func viewDidLayoutSubviews() {
        title1.frame = CGRect(x: 10, y: 50, width: 300, height: 50)
        myimgview.frame = CGRect(x: 0, y: title1.bottom + 20, width: view.width, height: 200)
        tv.frame = CGRect(x: 5, y: myimgview.bottom + 20, width: view.width - 20, height: 500)
    }
}
extension DetailScreen: UITableViewDataSource,UITableViewDelegate{
    func tblViewSetup(){
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Content")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steparray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentcell = tableView.dequeueReusableCell(withIdentifier: "Content", for: indexPath)
        contentcell.textLabel?.text = steparray[indexPath.row]
        return contentcell
    }
    
}
