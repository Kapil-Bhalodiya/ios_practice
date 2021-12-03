//
//  NewNoteVC.swift
//  MyFileManager
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewNoteVC: UIViewController {

    private let nameTextField:UITextField = {
        let txtpass = UITextField()
        txtpass.placeholder = "Enter File name"
        txtpass.textAlignment = .center
        txtpass.layer.cornerRadius = 25
        txtpass.backgroundColor = .white
        txtpass.textColor = .black
        return txtpass
    }()
    
    private let contentTextView:UITextView = {
        let txtview = UITextView()
        txtview.text=""
        txtview.textAlignment = .center
        txtview.backgroundColor = .gray
        return txtview
    }()
    
    private let saavebutton:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        btnreg.setTitle("Save", for: .normal)
        btnreg.backgroundColor = .blue
        btnreg.setTitleColor(.white, for: .normal)
        btnreg.layer.cornerRadius = 25
        return btnreg
    }()
    
    private let delbutton:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(delNote), for: .touchUpInside)
        btnreg.setTitle("Delete", for: .normal)
        btnreg.backgroundColor = .blue
        btnreg.setTitleColor(.white, for: .normal)
        btnreg.layer.cornerRadius = 25
        return btnreg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(nameTextField)
        view.addSubview(contentTextView)
        view.addSubview(saavebutton)
        view.addSubview(delbutton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
        let filepath = FileMangerService.getDocDir().appendingPathComponent("Abc.txt")
        let fetchContent = try String(contentsOf: filepath)
        print(fetchContent)
        }catch{
            print(error)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField.frame = CGRect(x: 40, y: 100, width: view.width-80, height: 40)
        contentTextView.frame = CGRect(x: 40, y: nameTextField.bottom+20, width: view.width-80, height: 300)
        saavebutton.frame = CGRect(x: 40, y: contentTextView.bottom+20, width: view.width-80, height: 40)
        delbutton.frame = CGRect(x: 40, y: saavebutton.bottom+20, width: view.width-80, height: 40)
    }
    
    @objc private func saveNote(){
        let name = nameTextField.text!
        let content = contentTextView.text!
        let filePath = FileMangerService.getDocDir().appendingPathComponent("\(name).txt")
        do{
            try content.write(to: filePath, atomically: true, encoding: .utf8)
        }catch{
            print(error)
        }
    }
    
    @objc private func delNote(){
        let filePath = FileMangerService.getDocDir().appendingPathComponent("kap.txt")
        do{
            try FileManager.default.removeItem(at: filePath)
        }catch{
            print(error)
        }
    }
}

