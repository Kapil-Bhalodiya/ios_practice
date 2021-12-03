//
//  LoginVC.swift
//  MyUserDefaults
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    private let textpass:UITextField = {
        let txtpass = UITextField()
        txtpass.placeholder = "Enter Your Name"
        txtpass.textAlignment = .center
        txtpass.layer.cornerRadius = 25
        txtpass.backgroundColor = .white
        txtpass.textColor = .black
        return txtpass
    }()
    
    private let loginbtn:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        btnreg.setTitle("Login", for: .normal)
        btnreg.backgroundColor = .blue
        btnreg.setTitleColor(.white, for: .normal)
        btnreg.layer.cornerRadius = 25
        return btnreg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginbtn)
        view.addSubview(textpass)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         textpass.frame = CGRect(x: 40, y: 100, width: view.width-80, height: 40)
        loginbtn.frame = CGRect(x: 40, y: 200, width: view.width-80, height: 40)
    }
    
    @objc private func loginTapped(){
        UserDefaults.standard.setValue(textpass.text, forKey: "Username")
        self.dismiss(animated: true)
    }

}
