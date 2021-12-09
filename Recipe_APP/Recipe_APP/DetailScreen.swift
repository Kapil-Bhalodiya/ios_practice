//
//  DetailScreen.swift
//  Recipe_APP
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DetailScreen: UIViewController {
    private let mystep1:UILabel = {
        let label = UILabel()
        label.text = "Step 1"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 3
        label.backgroundColor = .white
        return label
    }()
    
    private let mystep1_data:UILabel = {
        let label = UILabel()
        label.text = "Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options"
        label.numberOfLines = 3
        label.backgroundColor = .white
        return label
    }()
    
    private let mystep2:UILabel = {
        let label = UILabel()
        label.text = "Step 2"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 3
        label.backgroundColor = .white
        return label
    }()
    
    private let mystep2_data:UILabel = {
        let label = UILabel()
        label.text = "Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options"
        label.numberOfLines = 3
        label.backgroundColor = .white
        return label
    }()
    
    private let mystep3:UILabel = {
        let label = UILabel()
        label.text = "Step 3"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 3
        label.backgroundColor = .white
        return label
    }()
    
    private let mystep3_data:UILabel = {
        let label = UILabel()
        label.text = "Veggie burgers have become a popular healthy alternative to meat based burgers. These days, grocery stores and restaurants are offering many options"
        label.numberOfLines = 3
        label.backgroundColor = .white
        return label
    }()
    
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
        view.addSubview(mystep1)
        view.addSubview(mystep2)
        view.addSubview(mystep3)
        view.addSubview(mystep1_data)
        view.addSubview(mystep2_data)
        view.addSubview(mystep3_data)
    }
    override func viewDidLayoutSubviews() {
        title1.frame = CGRect(x: 10, y: 50, width: 300, height: 50)
        myimgview.frame = CGRect(x: 0, y: title1.bottom + 15, width: view.width, height: 150)
        mystep1.frame = CGRect(x: 5, y: myimgview.bottom + 10, width: view.width - 20, height: 30)
        mystep1_data.frame = CGRect(x: 5, y: mystep1.bottom + 5, width: view.width - 20, height: 80)
        mystep2.frame = CGRect(x: 5, y: mystep1_data.bottom + 5, width: view.width - 20, height: 30)
        mystep2_data.frame = CGRect(x: 5, y: mystep2.bottom + 5, width: view.width - 20, height: 80)
        mystep3.frame = CGRect(x: 5, y: mystep2_data.bottom + 5, width: view.width - 20, height: 30)
        mystep3_data.frame = CGRect(x: 5, y: mystep3.bottom + 5, width: view.width - 20, height: 80)
    }
}

