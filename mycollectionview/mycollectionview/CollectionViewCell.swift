//
//  CollectionViewCell.swift
//  mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    private let myimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.clipsToBounds = true
        return imgview
    }()
    
    func setupcell(with status:Int){
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.addSubview(myimgview)
        myimgview.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        
        let name = (status == 0) ? ("circle") : (status == 1 ? "multiply" : "")
        myimgview.image = UIImage(named:name)
    }
    
    @IBOutlet weak var myLabel: UILabel!
}
