//
//  ViewScreen.swift
//  TicTacToe_4X4
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewScreen: UIViewController {

    private var p1 = 0
    private var p2 = 0
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    private let winChance = [
                                [0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],
                                [0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],
                                [0,5,10,15],[3,6,9,12]
                            ]
    private var zeroFlag = true
    private let mycollection : UICollectionView = {
        let cvl = UICollectionViewFlowLayout()
        cvl.sectionInset = UIEdgeInsets(top: 150, left: 20, bottom: 30, right: 20)
        cvl.itemSize = CGSize(width: 75, height: 75)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: cvl)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let mylblp1:UILabel = {
        let lbl = UILabel()
        lbl.text = "Player 1 : "
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .red
        return lbl
    }()
    
    
    private let p1_point:UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .red
        return lbl
    }()
    
    private let mylblp2:UILabel = {
        let lbl = UILabel()
        lbl.text = "Player 2 : "
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .blue
        return lbl
    }()
    
    private let p2_point:UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .blue
        return lbl
    }()
    
    private let turn:UILabel = {
        let lbl = UILabel()
        lbl.text = "Player 1's turn......"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .red
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mycollection)
        view.addSubview(mylblp1)
        view.addSubview(mylblp2)
        view.addSubview(p1_point)
        view.addSubview(p2_point)
        view.addSubview(turn)
        setData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mycollection.frame = view.bounds
        mylblp1.frame = CGRect(x: 20, y: 50, width: view.width, height: 30)
        p1_point.frame = CGRect(x: 120, y: 50, width: view.width, height: 30)
        mylblp2.frame = CGRect(x: 20, y: mylblp1.bottom + 20, width: view.width, height: 30)
        p2_point.frame = CGRect(x: 120, y: mylblp1.bottom + 20, width: view.width, height: 30)
        turn.frame = CGRect(x: 120, y: 550, width: view.width, height: 30)
    }
}
extension ViewScreen : UICollectionViewDelegate,UICollectionViewDataSource{
    func setData(){
        mycollection.delegate = self
        mycollection.dataSource = self
        mycollection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return state.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.SetUpCell(with: state[indexPath.row])
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
            if zeroFlag{
                turn.text = "Player 1's turn....."
                mylblp1.textColor = .red
            }else{
                turn.text = "Player 2's turn....."
                mylblp2.textColor = .blue
            }
            collectionView.reloadSections(IndexSet(integer: 0))
            checkResult()
        }
    }
    func checkResult(){
        if !state.contains(2){
            let alert = UIAlertController(title: "Alert", message: "draw", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            var alert = UIAlertController()
            for i in winChance{
                if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[2] ] == state[ i[3] ] && state[ i[0] ] != 2
                {
                    //mylbl.text = "\(state[i[0]]) won"
                    if zeroFlag{
                        alert = UIAlertController(title: "Alert", message: "Player x is Win", preferredStyle: UIAlertController.Style.alert)
                        p1+=1
                        p1_point.text = "\(p1)"
                         readystate()
                    }
                    else{
                        alert = UIAlertController(title: "Alert", message: "Player o is win", preferredStyle: UIAlertController.Style.alert)
                        p2+=1
                        p2_point.text = "\(p2)"
                         readystate()
                    }
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    mycollection.reloadData()

                }
            }
        }
        
    }
    private func readystate() {
        state = [2,2,2,2,
                 2,2,2,2,
                 2,2,2,2,
                 2,2,2,2]
        zeroFlag = false
        mycollection.reloadData()
    }
}
