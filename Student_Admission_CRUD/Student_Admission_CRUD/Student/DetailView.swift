//
//  DetailView.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    private var DetailArray = [Student]()
    var Detail : Student?
    
    private let headlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Detail"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.font = UIFont(name: "Arial", size: 30)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let spidheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "SPID"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let spidlbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    
    private let Userheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Username"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Userlbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let Emailheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Email"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Emaillbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let Passheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Password"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Passlbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    
    private let Divheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Division"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Divlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "dsd"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let dateheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Date"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let datelbl:UILabel={
        let lbl = UILabel()
        lbl.text = "asd"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headlbl)
        view.addSubview(spidheadlbl)
        view.addSubview(spidlbl)
        view.addSubview(Userheadlbl)
        view.addSubview(Userlbl)
        view.addSubview(Passheadlbl)
        view.addSubview(Passlbl)
        view.addSubview(Divheadlbl)
        view.addSubview(Divlbl)
        view.addSubview(dateheadlbl)
        view.addSubview(datelbl)
        DetailArray = SQLiteHandler.sahred.fetchDetail()
        if let detail = Detail {
            spidlbl.text = String(detail.spid)
            Userlbl.text = detail.uname
            Passlbl.text = detail.password
            Divlbl.text = detail.div
            datelbl.text = detail.div
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(DetailArray[0])
       
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headlbl.frame = CGRect(x: 50, y: 60, width: view.width - 100, height: 50)
        spidheadlbl.frame = CGRect(x: 20, y: headlbl.bottom + 10, width: 150, height: 40)
        spidlbl.frame = CGRect(x: 20, y: spidheadlbl.bottom + 20, width: view.width - 100, height: 40)
        Userheadlbl.frame = CGRect(x: 20, y: spidlbl.bottom + 20, width: 150, height: 40)
        Userlbl.frame = CGRect(x: 20, y: Userheadlbl.bottom + 10, width: view.width - 100, height: 40)
        Passheadlbl.frame = CGRect(x: 20, y: Userlbl.bottom + 20, width: 150, height: 40)
        Passlbl.frame = CGRect(x: 20, y: Passheadlbl.bottom + 10, width: view.width - 100, height: 40)
        Divheadlbl.frame = CGRect(x: 20, y: Passlbl.bottom + 20, width: 150, height: 40)
        Divlbl.frame = CGRect(x: 20, y: Divheadlbl.bottom + 10, width: view.width - 100, height: 40)
        dateheadlbl.frame = CGRect(x: 20, y: Divlbl.bottom + 20, width: 150, height: 40)
        datelbl.frame = CGRect(x: 20, y: dateheadlbl.bottom + 10, width: view.width - 100, height: 40)
    }
}

