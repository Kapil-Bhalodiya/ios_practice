//
//  LoginView.swift
//  CRUD_FileNotes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    private let uname = ""
    private let password = ""
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Login"
        lbl.font = UIFont.boldSystemFont(ofSize: 80)
        lbl.font = UIFont(name: "Arial", size: 40)
        return lbl
    }()
    
    private let displaylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Please Sign in to Continue...."
        return lbl
    }()
    
    private let mytextemail:UITextField = {
        let txtemail = UITextField()
        txtemail.placeholder = "Enter Your Email"
        txtemail.layer.shadowOpacity = 0.5
        txtemail.layer.shadowRadius = 4.0
        txtemail.layer.cornerRadius = 10
        txtemail.backgroundColor = .white
        txtemail.textColor = .black
        return txtemail
    }()
    private let mytextpass:UITextField = {
        let txtpass = UITextField()
        txtpass.placeholder = "Enter Your Password"
        txtpass.isSecureTextEntry = true
        txtpass.layer.shadowOpacity = 0.5
        txtpass.layer.shadowRadius = 4.0
        txtpass.layer.cornerRadius = 10
        txtpass.backgroundColor = .white
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
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg_receipt")!)
        view.addSubview(mylbl)
        view.addSubview(mytextemail)
        view.addSubview(mytextpass)
        view.addSubview(mybutton)
        view.addSubview(displaylbl)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        mylbl.frame = CGRect(x: 20, y: 90, width: view.width, height: 60)
        displaylbl.frame = CGRect(x: 20, y: mylbl.bottom + 10, width: view.width-100, height: 20)
        mytextemail.frame = CGRect(x: 20, y: displaylbl.bottom + 30, width: view.width-40, height: 40)
        mytextpass.frame = CGRect(x: 20, y: mytextemail.bottom+20, width: view.width-40, height: 40)
        mybutton.frame = CGRect(x: mytextpass.right - 80, y: mytextpass.bottom+30, width: view.width-300, height: 40)
        
    }
    
    @objc func MoveToLogin(){
        if(mytextemail.text == uname && mytextpass.text == password){
            print("OK")
            let nav = List_File()
            //nav.modalTransitionStyle = .fullScreen
            navigationController?.pushViewController(nav, animated: true)
            //nav.setNavigationBarHidden(true, animated: false)
            //present(dtv,animated: false)
            //self.dismiss(animated: false, completion: nil)
        }else{
            print("hey")
            displaylbl.textColor = .red
            displaylbl.text = "Invalid Username and Password...!"
        }
    }
    
}

