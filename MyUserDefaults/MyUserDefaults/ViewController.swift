//
//  ViewController.swift
//  MyUserDefaults
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textAlignment = .center
        return lbl
    }()
    private let button:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        btnreg.setTitle("LOGOUT", for: .normal)
        btnreg.backgroundColor = .blue
        btnreg.setTitleColor(.white, for: .normal)
        btnreg.layer.cornerRadius = 25
        return btnreg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       view.addSubview(mylbl)
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkAuth()
    }
    
    private func checkAuth(){
        if let uname = UserDefaults.standard.string(forKey: "Username"){
            mylbl.text = "Welcom \(uname)"
        }else{
            let vc = LoginVC()
            let nav = UINavigationController(rootViewController: vc)
            //nav.modalTransitionStyle = .fullScreen
            nav.setNavigationBarHidden(true, animated: false)
            present(nav,animated: false)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mylbl.frame = CGRect(x: 40, y: 200, width: view.frame.width-80, height: 40)
        button.frame = CGRect(x: 40, y: mylbl.bottom+20, width: view.width-80, height: 40)
    }
    
    @objc private func logoutTapped(){
        UserDefaults.standard.setValue(nil, forKey: "Username")
        checkAuth()
    }
}

