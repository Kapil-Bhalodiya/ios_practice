//
//  AddPage.swift
//  CRUD_Notes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit


class AddPage: UIViewController {
    
    var employee : Employee?

    
    private let Txt1: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter Username"
        name.text = UserDefaults.standard.string(forKey: "listname")
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let Txt2: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter Email"
        name.text = UserDefaults.standard.string(forKey: "listname")
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let Txt3: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter Password"
        name.text = UserDefaults.standard.string(forKey: "listname")
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let SaveBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(Save), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(Txt1)
        view.addSubview(Txt2)
        view.addSubview(Txt3)
        view.addSubview(SaveBtn)
        navigationController?.setNavigationBarHidden(false, animated: false)
//        if(UserDefaults.standard.string(forKey: "listname"){
//            SaveBtn.setTitle("Edit", for: .normal)
//        }
        
        if let emp = employee {
            Txt1.text = emp.name
            Txt2.text = String(emp.age)
            Txt3.text = emp.phone
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Txt1.frame = CGRect(x: 50, y: 80, width: view.width-100, height: 30)
        Txt2.frame = CGRect(x: 50, y: Txt1.bottom + 20, width: view.width-100, height: 30)
        Txt3.frame = CGRect(x: 50, y: Txt2.bottom + 20, width: view.width-100, height: 30)
        SaveBtn.frame = CGRect(x: 50, y: Txt3.bottom + 20, width: view.width-100, height: 30)
    }
    
    @objc func Save(){
        let name = Txt1.text!
        let age = Int(Txt2.text!)!
        let phone = Txt3.text!
        
        if let emp = employee {
            let UpdateEmp = Employee(id: emp.id, name: name, age: age, phone: phone)
            update(emp: UpdateEmp)
            print("Update is \(UpdateEmp)")
        }else{
            print("Insert")
            let emp = Employee(id: 0, name: name, age: age, phone: phone)
            insert(emp: emp)
        }
    }
    
    private func insert(emp:Employee){
        SQLiteHandler.sahred.insert(emp: emp){
            success in
            if success {
                print("Ins Suceess at VC")
                self.resetFields()
            } else {
                print("Ins Fail at VC")
            }
        }
    }
    
    private func update(emp: Employee){
        SQLiteHandler.sahred.update(emp: emp){
            success in
            if success {
                print("Up Suceess at VC")
                self.resetFields()
            } else {
                print("Up Fail at VC")
            }
        }
    }
    
    @objc func resetFields(){
        employee = nil
        Txt1.text = ""
        Txt2.text = ""
        Txt3.text = ""
    }
}
