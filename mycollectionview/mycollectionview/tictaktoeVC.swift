//
//  tictaktoeVC.swift
//  mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class tictaktoeVC: UIViewController {

    private var state = [2,2,2,
                         2,2,2,
                         2,2,2]
    
    private let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    private var zeroFlag = false
    
    private let mycollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let mylbl:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textColor = .red
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mycollection)
        view.addSubview(mylbl)
        setupcollcetionview()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mycollection.frame = view.bounds
        mylbl.frame = CGRect(x: 50, y: 70, width: 100, height: 30)
    }
}
extension tictaktoeVC : UICollectionViewDataSource,UICollectionViewDelegate{

    private func setupcollcetionview(){
        mycollection.dataSource = self
        mycollection.delegate = self
        mycollection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return state.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.setupcell(with: state[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1{
           state.remove(at: indexPath.row)
            if zeroFlag{
                state.insert(0, at: indexPath.row)
            }else {
                state.insert(1, at: indexPath.row)
            }
            zeroFlag = !zeroFlag
            collectionView.reloadSections(IndexSet(integer: 0))
            checkwinner()
        }
    }
    private func checkwinner(){
        if !state.contains(2){
            mylbl.text = "Draw.."
        }else{
            for i in winningCombinations{
                print(i[0])
                if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[0] ] != 2
                {
                    readystate()
                    mylbl.text = "\(state[i[0]]) won"
                }
            }
        }
    }
    private func readystate() {
        state = [2,2,2,
                 2,2,2,
                 2,2,2]
        zeroFlag = false
        mycollection.reloadData()
    }
}
