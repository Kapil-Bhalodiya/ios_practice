//
//  LoginVC.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 13/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private let txtEmail:UITextField = {
        
        let email = UITextField()
        
        
        email.layer.cornerRadius = 10
        email.placeholder = "Email ID"
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: email.height))
        email.leftViewMode = .always
        email.layer.shadowColor = #colorLiteral(red: 0.2680937266, green: 0.5423540228, blue: 0.1122479198, alpha: 1)
        email.layer.shadowOpacity = 0.5
        email.layer.shadowRadius = 4.0
        email.layer.borderWidth = 1.0
        let img = UIImageView(frame: CGRect(x: 2, y: 2, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "email-icon")
        email.rightView = img
        email.rightViewMode = .always
        return email
    }()
   
    private let txtPass:UITextField = {
        let password = UITextField()
        password.layer.cornerRadius = 10
        password.placeholder = "Password"
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.height))
        password.leftViewMode = .always
        password.layer.shadowColor = #colorLiteral(red: 0.3197782056, green: 0.5420504282, blue: 0.1631173479, alpha: 1)
        password.layer.shadowOpacity = 0.7
        password.layer.shadowRadius = 2.0
        password.layer.borderWidth = 1.0
        let img = UIImageView(frame: CGRect(x: 2, y: 2, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "password-icon")
        password.rightView = img
        password.rightViewMode = .always
        return password
    }()
    
    private let forgetpass:UILabel={
        let lbl = UILabel()
        lbl.text = "forget your password?"
        lbl.font = lbl.font.withSize(15)
        return lbl
    }()
    
    private let loginbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1769022816, green: 0.5545053433, blue: 0.07903720916, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    @objc func loginClick(){
        let admin = AdminView()
        navigationController?.pushViewController(admin, animated: true)
    }
    
    @objc func registerClick(){
        print("hey")
        let reg = RegisterVC()
        navigationController?.pushViewController(reg, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(txtEmail)
        view.addSubview(txtPass)
        view.addSubview(forgetpass)
        view.addSubview(loginbtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtEmail.frame = CGRect(x: 60, y: 350, width: view.width - 120, height: 40)
        txtPass.frame = CGRect(x: 60, y: txtEmail.bottom + 20, width: view.width - 120, height: 40)
        forgetpass.frame = CGRect(x: 165, y: txtPass.bottom+10, width: view.width - 20, height: 20)
        loginbtn.frame = CGRect(x: 120, y: forgetpass.bottom + 50, width: view.width - 240, height: 40)
    }
    
}
