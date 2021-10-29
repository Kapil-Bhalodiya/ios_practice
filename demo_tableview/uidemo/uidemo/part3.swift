//
//  part3.swift
//  uidemo
//
//  Created by DCS on 29/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class part3: UIViewController {
    
    private let toolBar : UIToolbar = {
        let tool = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handlecompose))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let item2 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handlecamera))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handlegallery))
        tool.items = [item1,space,item2,gallery]
        return tool
    }()
    
    private let myimg : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "img.jpg")
        return img
    }()
    
    private let imgpicker : UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = true
        return ip
    }()
    
    private let tabbar:UITabBar = {
        let tabbar = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .favorites,tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let item3 = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        tabbar.items = [item1,item2,item3]
        return tabbar
        
    }()
    
    @objc private func handlecompose(){
        print("compose")
    }
    @objc private func handlecamera(){
        print("camera")
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imgpicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imgpicker, animated: true)
            }
        }else{
            print("camera not available..!")
        }
    }
    @objc private func handlegallery(){
        print("Gallery")
        imgpicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imgpicker, animated: true)
        }
    }
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Screen 3"
        view.addSubview(toolBar)
        view.addSubview(tabbar)
        view.addSubview(myimg)
        tabbar.delegate = self
        imgpicker.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        let toolbarheight = view.safeAreaInsets.top + 100
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: toolbarheight)
        
        let tabbarheight = view.safeAreaInsets.bottom + 50
        tabbar.frame = CGRect(x: 0, y: view.frame.height - tabbarheight, width: view.frame.width, height: tabbarheight)
        myimg.frame = CGRect(x: 20, y: 150 , width: view.frame.width - 40, height: 200)
    }
}
extension part3 : UITabBarDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let seletedimg = info[.originalImage] as? UIImage{
            myimg.image = seletedimg
        }
        imgpicker.dismiss(animated: true)
        
    }
}
