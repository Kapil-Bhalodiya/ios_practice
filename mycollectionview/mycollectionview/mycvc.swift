//
//  mycvc.swift
//  mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class mycvc: UIViewController {
    
    private let citycollectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var cityArray = ["abBerlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Nairobi","Helsinki","Oslo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(citycollectionview)
        collectionviewsetup()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        citycollectionview.frame = CGRect(
            x: 0,
            y:view.safeAreaInsets.top,
            width: view.frame.size.width,
            height: view.frame.height - view.safeAreaInsets.top -
                view.safeAreaInsets.bottom
        )
    }
}
extension mycvc:UICollectionViewDelegate,UICollectionViewDataSource{
    private func collectionviewsetup(){
        citycollectionview.dataSource = self
        citycollectionview.delegate = self
        citycollectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return cityArray.count
        }else{
            return cityArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as! CollectionViewCell
            cell.myLabel.text=self.cityArray[indexPath.row]
            cell.backgroundColor = .blue
            return cell
        }else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as! CollectionViewCell
            cell.myLabel.text=self.cityArray[indexPath.row]
            cell.backgroundColor = .black
            return cell
        }
    }
}
