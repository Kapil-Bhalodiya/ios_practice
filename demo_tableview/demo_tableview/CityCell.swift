//
//  CityCell.swift
//  demo_tableview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    private let myimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
        imgview.clipsToBounds = true
        return imgview
    }()
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        //lbl.text = .boldSystemFont(ofSize:20)
        return lbl
    }()
    
    func setUpCityCell(title name:String){
        contentView.addSubview(myimgview)
        contentView.addSubview(mylbl)
        myimgview.frame = CGRect(x:20,y:20,width: 80,height: 80)
        mylbl.frame = CGRect(x:myimgview.right + 20 , y:20,width: 200,height: 80)
        myimgview.image = UIImage(named: name)
        mylbl.text = name
    }
}
