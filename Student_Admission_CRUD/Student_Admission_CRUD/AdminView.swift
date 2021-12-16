//
//  AdminView.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 14/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AdminView: UIViewController {
    private let tblview = UITableView()
    private var studArray = [Student]()
    
    private let noticeBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(noticeClick), for: .touchUpInside)
        btn.layer.cornerRadius = 30
        return btn
    }()
    
    private let myToll : UIToolbar = {
        let tool = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
      
        let item3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ClickAdd))
        tool.items = [space,item3]
        return tool
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Admin"
        view.addSubview(tblview)
        view.addSubview(myToll)
        view.addSubview(noticeBtn)
        view.backgroundColor = .white
        tblViewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight : CGFloat = view.safeAreaInsets.top + 10.0
        myToll.frame = CGRect(x: 0, y: 20, width: view.width, height: toolBarHeight)
        noticeBtn.frame = CGRect(x: 50, y: myToll.bottom + 60, width: view.width - 100, height: 40)
        tblview.frame = CGRect(x: 0, y: myToll.bottom + 10, width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        studArray = SQLiteHandler.sahred.fetch()
        tblview.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func noticeClick(){
        let noticevc = Notice()
        navigationController?.pushViewController(noticevc, animated: true)
    }
    
    @objc func ClickAdd(){
        let register = RegisterVC()
        navigationController?.pushViewController(register, animated: true)
    }
    
    
}
extension AdminView:UITableViewDelegate,UITableViewDataSource {
    func tblViewSetup(){
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "NameCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        let stud = studArray[indexPath.row]
        cell.textLabel?.text = "\(stud.spid) \t | \t \(stud.uname) \t | \t \(stud.gender) | \t \(stud.email) | \t \(stud.div) | \t \(stud.dob)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //UserDefaults.standard.setValue(empArray[indexPath.row], forKey: "listname")
        let add = RegisterVC()
        add.student = studArray[indexPath.row]
        navigationController?.pushViewController(add, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let id = studArray[indexPath.row].spid

        SQLiteHandler.sahred.delete(for: id){
            success in
            if success {
                print(id)
                self.studArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }else{
                print("not delete")
            }
        }
    }
}
