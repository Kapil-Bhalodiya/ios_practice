//
//  LoginView.swift
//  CRUD_FileNotes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    private let uname = "Admin"
    private let password = "admin"
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Login"
        lbl.textColor = .orange
        lbl.font = UIFont.boldSystemFont(ofSize: 80)
        lbl.font = UIFont(name: "Arial", size: 40)
        return lbl
    }()
    
    private let displaylbl:UILabel={
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Please Sign in to Continue...."
        lbl.font = lbl.font.withSize(10)
        return lbl
    }()
    
    private let mytextemail:UITextField = {
        let txtemail = UITextField()
        txtemail.attributedPlaceholder = NSAttributedString(
            string: "Enter Your Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtemail.layer.shadowOpacity = 0.5
        txtemail.layer.shadowRadius = 4.0
        txtemail.layer.cornerRadius = 10
        txtemail.textColor = .black
        return txtemail
    }()
    private let mytextpass:UITextField = {
        let txtpass = UITextField()
        txtpass.attributedPlaceholder = NSAttributedString(
            string: "**********",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtpass.isSecureTextEntry = true
        txtpass.layer.shadowOpacity = 1
        txtpass.layer.shadowRadius = 4.0
        txtpass.layer.cornerRadius = 10
        txtpass.textColor = .black
        return txtpass
    }()
    
    private let mybutton:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(MoveToLogin), for: .touchUpInside)
        btnreg.setTitle("Sign Up", for: .normal)
        btnreg.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btnreg.backgroundColor = .orange
        btnreg.setTitleColor(.white, for: .normal)
        btnreg.layer.cornerRadius = 10
        return btnreg
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bd_login")!)
        view.addSubview(mylbl)
        view.addSubview(mytextemail)
        view.addSubview(mytextpass)
        view.addSubview(mybutton)
        view.addSubview(displaylbl)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        mylbl.frame = CGRect(x: 20, y: 90, width: view.width, height: 60)
        displaylbl.frame = CGRect(x: 20, y: mylbl.bottom + 10, width: view.width-150, height: 20)
        mytextemail.frame = CGRect(x: 20, y: displaylbl.bottom + 30, width: view.width-40, height: 40)
        mytextpass.frame = CGRect(x: 20, y: mytextemail.bottom+20, width: view.width-40, height: 40)
        mybutton.frame = CGRect(x: mytextpass.right - 80, y: mytextpass.bottom+30, width: view.width-300, height: 40)
    }
    
    @objc func MoveToLogin(){
        if(mytextemail.text == uname && mytextpass.text == password){
            UserDefaults.standard.setValue(mytextemail.text, forKey: "Email")
            print("OK")
            let nav = ListFile()
            navigationController?.pushViewController(nav, animated: true)
        }else{
            let alert = UIAlertController.init(title: "Login Fail..", message: "Incorrect Email or Password..!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

