//
//  ViewController.swift
//  Gesture_Asg
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imgpicker : UIImagePickerController = {
        let img = UIImagePickerController()
        img.allowsEditing = true
        return img
    }()
    
    private let imgView : UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.image = UIImage(named: "bg_UI")
        imgview.layer.cornerRadius = 10
        imgview.clipsToBounds = true
        return imgview
    }()
    
    private let UpBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Upload", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(Upload), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    
    private let myVIew : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(myVIew)
        imgpicker.delegate = self
        view.addSubview(imgView)
        view.addSubview(UpBtn)
        
                let tapGestuer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
                tapGestuer.numberOfTapsRequired = 1
                tapGestuer.numberOfTouchesRequired = 1
                myVIew.addGestureRecognizer(tapGestuer)
        
                let pintchGestuer = UIPinchGestureRecognizer(target: self, action: #selector(didPintchView))
                view.addGestureRecognizer(pintchGestuer)
        
                let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(didRoateView))
                view.addGestureRecognizer(rotateGesture)
    
                let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
                leftswipe.direction = .left
                view.addGestureRecognizer(leftswipe)
        
                let right = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
                right.direction = .right
                view.addGestureRecognizer(right)
        
                let up = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
                up.direction = .up
                view.addGestureRecognizer(up)
        
                let down = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
                down.direction = .down
                view.addGestureRecognizer(down)
        
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanView))
                view.addGestureRecognizer(panGesture)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgView.frame = CGRect(x: 50, y: 250, width: view.width-100, height: 200)
        UpBtn.frame = CGRect(x: 130, y: 600, width: view.width - 260, height: 30)
        
    }
    
    @objc func Upload(){
        imgpicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imgpicker, animated: true)
        }
    }
}
extension ViewController {
    
        @objc private func didTapView(gesture: UITapGestureRecognizer){
            print("Location: \(gesture.location(in: view))")
            print("MyView Location :  \(gesture.location(in: imgView))")
        }
    
        @objc private func didPintchView(getsture: UIPinchGestureRecognizer){
            print(getsture)
            imgView.transform = CGAffineTransform(scaleX: getsture.scale, y: getsture.scale)
        }
    
        @objc private func didRoateView(getsture: UIRotationGestureRecognizer){
                    print(getsture)
                    imgView.transform = CGAffineTransform(rotationAngle: getsture.rotation)
                }
    
        @objc private func didSwipeView(gesture: UISwipeGestureRecognizer){
            if gesture.direction == .left {
                imgView.frame = CGRect(x: imgView.frame.origin.x - 40, y: imgView.frame.origin.y, width: 200, height: 200)
            }
            else if gesture.direction == .right {
                UIView.animate(withDuration: 0.5){
                self.imgView.frame = CGRect(x: self.imgView.frame.origin.x + 40, y: self.imgView.frame.origin.y, width: 200, height: 200)
    
                }
            }
            else if gesture.direction == .up {
                imgView.frame = CGRect(x: imgView.frame.origin.x, y: imgView.frame.origin.y-40, width: 200, height: 200)
            }
            else if gesture.direction == .down {
                imgView.frame = CGRect(x: imgView.frame.origin.x, y: imgView.frame.origin.y+40, width: 200, height: 200)
                }
            }
    
    
    @objc private func didPanView(gesture: UIPanGestureRecognizer){
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y

        imgView.center = CGPoint(x: x,y: y)
    }
}
extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let getImage = info[.originalImage] as? UIImage{
            imgView.image = getImage
        }
        imgpicker.dismiss(animated: true)
    }
}

