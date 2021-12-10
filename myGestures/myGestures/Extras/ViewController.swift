//
//  ViewController.swift
//  myGestures
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let imgView : UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.image = UIImage(named: "bg_UI")
        imgview.layer.cornerRadius = 50
        imgview.backgroundColor = .red
        imgview.clipsToBounds = true
        return imgview
    }()
    
    private let myVIew : UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        view.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myVIew)
//        let tapGestuer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
//        tapGestuer.numberOfTapsRequired = 1
//        tapGestuer.numberOfTouchesRequired = 1
//        myVIew.addGestureRecognizer(tapGestuer)

//        let pintchGestuer = UIPinchGestureRecognizer(target: self, action: #selector(didPintchView))
//        view.addGestureRecognizer(pintchGestuer)

//        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(didRoateView))
//        view.addGestureRecognizer(rotateGesture)
//    }
        
//        let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
//        leftswipe.direction = .left
//        view.addGestureRecognizer(leftswipe)
//
//        let right = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
//        right.direction = .right
//        view.addGestureRecognizer(right)
//
//        let up = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
//        up.direction = .up
//        view.addGestureRecognizer(up)
//
//        let down = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
//        down.direction = .down
//        view.addGestureRecognizer(down)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanView))
        view.addGestureRecognizer(panGesture)
    
    }
}
extension ViewController {
//    @objc private func didTapView(gesture: UITapGestureRecognizer){
//        print("Location: \(gesture.location(in: view))")
//        print("MyView Location :  \(gesture.location(in: myVIew))")
//    }
    
//    @objc private func didPintchView(getsture: UIPinchGestureRecognizer){
//        print(getsture)
//        myVIew.transform = CGAffineTransform(scaleX: getsture.scale, y: getsture.scale)
//    }
    
    //    @objc private func didRoateView(getsture: UIRotationGestureRecognizer){
    //                print(getsture)
    //                myVIew.transform = CGAffineTransform(rotationAngle: getsture.rotation)
    //            }
    
//    @objc private func didSwipeView(gesture: UISwipeGestureRecognizer){
//        if gesture.direction == .left {
//            myVIew.frame = CGRect(x: myVIew.frame.origin.x - 40, y: myVIew.frame.origin.y, width: 200, height: 200)
//        }
//        else if gesture.direction == .right {
//            UIView.animate(withDuration: 0.5){
//            self.myVIew.frame = CGRect(x: self.myVIew.frame.origin.x + 40, y: self.myVIew.frame.origin.y, width: 200, height: 200)
//
//            }
//        }
//        else if gesture.direction == .up {
//            myVIew.frame = CGRect(x: myVIew.frame.origin.x, y: myVIew.frame.origin.y-40, width: 200, height: 200)
//        }
//        else if gesture.direction == .down {
//            myVIew.frame = CGRect(x: myVIew.frame.origin.x, y: myVIew.frame.origin.y+40, width: 200, height: 200)
//            }
//        }
    
    
    @objc private func didPanView(gesture: UIPanGestureRecognizer){
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        
        myVIew.center = CGPoint(x: x,y: y)
    }
}

