//
//  CollectionViewCell.swift
//  TicTacToe_4X4
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    private let myimgview : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    func SetUpCell(with status:Int) {
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.addSubview(myimgview)
        myimgview.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        let name = (status == 0) ? ("o") : (status == 1 ? "x" : "")
        myimgview.image = UIImage(named:name)
    }
}
