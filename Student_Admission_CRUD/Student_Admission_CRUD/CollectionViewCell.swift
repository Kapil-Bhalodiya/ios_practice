//
//  CollectionViewCell.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let mytitle:UILabel = {
        let label = UILabel()
        label.text = ""
        label.shadowColor = .gray
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let myDate:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    func SetUpCell(with status:NoticeDB) {
        contentView.addSubview(mytitle)
        contentView.addSubview(myDate)
        mytitle.text = "\(status.title)"
        mytitle.frame = CGRect(x: 5, y: 10, width: 100, height: 20)
        myDate.text = "\(status.don)"
        myDate.frame = CGRect(x: 15, y: mytitle.bottom + 5, width: 100, height: 20)
    }
}
