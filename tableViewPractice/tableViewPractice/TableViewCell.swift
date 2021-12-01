//
//  TableViewCell.swift
//  tableViewPractice
//
//  Created by DCS on 01/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private let myimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
        imgview.clipsToBounds = true
        return imgview
    }()
    private let mysecimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
        imgview.clipsToBounds = true
        return imgview
    }()
    private let mylbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textColor = .black
        return lbl
    }()
    func setUpData(title name:String,stitle cname:String){
        contentView.addSubview(myimgview)
        contentView.addSubview(mylbl)
        contentView.addSubview(mysecimgview)
        
        myimgview.frame = CGRect(x: 20, y: 20, width: 80, height: 80)
        mylbl.frame = CGRect(x:myimgview.right + 70, y: 20, width: 80, height: 80)
        mysecimgview.frame = CGRect(x:mylbl.right+50, y: 20, width: 80, height: 80)
        
        myimgview.image = UIImage(named: name)
        mysecimgview.image = UIImage(named: cname)
        mylbl.text = name
    }
}
