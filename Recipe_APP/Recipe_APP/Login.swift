//
//  Login.swift
//  Recipe_APP
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Login: UIViewController {
    private let uname = "Admin"
    private let password = "Admin"
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Recipe"
        lbl.textColor = .green
        lbl.font = UIFont.boldSystemFont(ofSize: 100)
        lbl.font = UIFont(name: "HelveticaNeue-UltraLight", size: 60)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let errlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "You're Hungry ??....."
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let mytextemail:UITextField = {
        let txtemail = UITextField()
        txtemail.placeholder = "Enter Your Email"
        txtemail.textAlignment = .center
        txtemail.layer.cornerRadius = 20
        txtemail.backgroundColor = .white
        txtemail.textColor = .black
        return txtemail
    }()
    private let mytextpass:UITextField = {
        let txtpass = UITextField()
        txtpass.placeholder = "Enter Your Password"
        txtpass.isSecureTextEntry = true
        txtpass.textAlignment = .center
        txtpass.textContentType = .password
        txtpass.layer.cornerRadius = 20
        txtpass.backgroundColor = .white
        txtpass.textColor = .black
        return txtpass
    }()
    
    private let mybutton:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(MoveToLogin), for: .touchUpInside)
        btnreg.setTitle("LOGIN", for: .normal)
        btnreg.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btnreg.backgroundColor = .green
        btnreg.setTitleColor(.white, for: .normal)
        
        btnreg.layer.cornerRadius = 10
        return btnreg
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg_receipt")!)
        view.addSubview(mylbl)
        view.addSubview(mytextemail)
        view.addSubview(mytextpass)
        view.addSubview(mybutton)
        view.addSubview(errlbl)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        mylbl.frame = CGRect(x: 70, y: 90, width: view.width-140, height: 60)
        mytextemail.frame = CGRect(x: 50, y: mylbl.bottom + 50, width: view.width-100, height: 40)
        mytextpass.frame = CGRect(x: 50, y: mytextemail.bottom+20, width: view.width-100, height: 40)
        mybutton.frame = CGRect(x: 50, y: mytextpass.bottom+30, width: view.width-100, height: 40)
        errlbl.frame = CGRect(x: 50, y: mybutton.bottom+180, width: view.width-100, height: 50)
    }
    
    @objc func MoveToLogin(){
        if(mytextemail.text == uname && mytextpass.text == password){
            print("OK")
            let dtv = DataTableView()
            //let nav = UINavigationController(rootViewController: dtv)
            //nav.modalTransitionStyle = .fullScreen
            navigationController?.pushViewController(dtv, animated: true)
            //nav.setNavigationBarHidden(true, animated: false)
            //present(dtv,animated: false)
            //self.dismiss(animated: false, completion: nil)
        }else{
            print("hey")
            errlbl.textColor = .red
            errlbl.text = "Invalid Username and Password...!"
        }
    }

}
