//
//  DetailScreen.swift
//  Recipe_APP
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DetailScreen: UIViewController {

    private let steparray = ["Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options, that try to mimic a meat texture, to custom made black bean and veggie patties and more","Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options, that try to mimic a meat texture, to custom made black bean and veggie patties and more","Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options, that try to mimic a meat texture, to custom made black bean and veggie patties and more"]
    
    private let title1:UILabel = {
        let lbl = UILabel()
        lbl.text = "American Burger"
        lbl.font = UIFont.boldSystemFont(ofSize:20)
        return lbl
    }()
    private let stepdata:UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .red
        lbl.numberOfLines = 3
        return lbl
    }()
    private let myimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 10
        imgview.image = UIImage(named: "American Burger")
        imgview.clipsToBounds = true
        return imgview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myimgview)
        view.addSubview(stepdata)
        view.addSubview(title1)
    }
    override func viewDidLayoutSubviews() {
        title1.frame = CGRect(x: 10, y: 50, width: 300, height: 50)
        for i in steparray {
            stepdata.text = i
            stepdata.frame = CGRect(x: 5, y: 200, width: view.width - 10, height: 500)
        }
       
        myimgview.frame = CGRect(x: 0, y: title1.bottom + 20, width: view.width, height: 200)
    }
}
