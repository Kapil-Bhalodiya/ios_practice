//
//  List_File.swift
//  CRUD_FileNotes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewFile: UIViewController {
    
    var fileget : String = ""
    
    private let FileName:UITextField = {
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
        txtview.layer.cornerRadius = 5
        txtview.font = txtview.font?.withSize(80)
        txtview.textColor = .white
        txtview.backgroundColor = .gray
        return txtview
    }()
    
    private let saavebutton:UIButton = {
        let btnreg = UIButton()
        btnreg.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        btnreg.setTitle("Save", for: .normal)
        btnreg.backgroundColor = .orange
        btnreg.setTitleColor(.white, for: .normal)
        btnreg.layer.cornerRadius = 25
        return btnreg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(FileName)
        view.addSubview(contentTextView)
        view.addSubview(saavebutton)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            let filepath = FileMangerService.getDocDir().appendingPathComponent("\(fileget).txt")
            let fetchContent = try String(contentsOf: filepath)
            FileName.text = fileget
            contentTextView.text = fetchContent
            saavebutton.setTitle("Update", for: .normal)
            print(fetchContent)
        }catch{
            print(error)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        FileName.frame = CGRect(x: 40, y: 100, width: view.width-80, height: 40)
        contentTextView.frame = CGRect(x: 40, y: FileName.bottom+20, width: view.width-80, height: 300)
        saavebutton.frame = CGRect(x: 40, y: contentTextView.bottom+20, width: view.width-80, height: 40)
    }
    
    @objc private func saveNote(){
        let name = FileName.text!
        let content = contentTextView.text!
        
        let filePath = FileMangerService.getDocDir().appendingPathComponent("\(name).txt")
        do{
            try content.write(to: filePath, atomically: true, encoding: .utf8)
            let alert = UIAlertController.init(title: "File", message: "Suceesfully Added..!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }catch{
            print(error)
        }
    }
}
