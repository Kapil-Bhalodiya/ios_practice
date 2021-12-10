//
//  List_tblView.swift
//  CRUD_Notes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class List_tblView: UIViewController {
    
    private let tblview = UITableView()
    private var empArray = [Employee]()
    
    private let myToll : UIToolbar = {
        let tool = UIToolbar()
        //let item1 = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ClickedHome))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        //let item2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ClickAdd))
        let item3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ClickAdd))
        tool.items = [space,space,item3]
        return tool
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        view.addSubview(tblview)
        view.addSubview(myToll)
        
        //tepm.insert(emp: , copletion: true)
        
        tblViewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight : CGFloat = view.safeAreaInsets.top + 10.0
        myToll.frame = CGRect(x: 0, y: 10, width: view.width, height: toolBarHeight)
        tblview.frame = CGRect(x: 0, y: myToll.bottom + 10, width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tblview.reloadData()
        empArray = SQLiteHandler.sahred.fetch()
        tblview.reloadData()
        
        //let temp = SQLiteHandler.sahred
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @objc func ClickedHome(){
        let Home = AddPage()
        navigationController?.pushViewController(Home, animated: true)
        //present(P1, animated: true, completion: nil)
    }
    
    @objc func ClickAdd(){
         UserDefaults.standard.setValue(nil, forKey: "listname")
        let add = AddPage()
        navigationController?.pushViewController(add, animated: true)
        //present(P3, animated: true, completion: nil)
    }
    
}
extension List_tblView:UITableViewDelegate,UITableViewDataSource {
    func tblViewSetup(){
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "NameCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        let emp = empArray[indexPath.row]
        cell.textLabel?.text = "\(emp.name) \t | \t \(emp.age) \t | \t \(emp.phone)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Notes"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //UserDefaults.standard.setValue(empArray[indexPath.row], forKey: "listname")
        let add = AddPage()
        add.employee = empArray[indexPath.row]
        navigationController?.pushViewController(add, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let id = empArray[indexPath.row].id
        
        SQLiteHandler.sahred.delete(for: id){
            success in
            if success {
                self.empArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }else{
                print("not delete")
            }
        }
    }

}
