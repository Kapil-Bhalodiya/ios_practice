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
    private var NoteArray = [NoticeDB]()
    
    private let tabbar:UITabBar = {
        let tool = UITabBar()
        let item1 = UITabBarItem(title: "Student", image: #imageLiteral(resourceName: "student"), tag: 1)
        let item2 = UITabBarItem(title: "Notice", image: #imageLiteral(resourceName: "notes"), tag: 2)
        tool.tintColor = #colorLiteral(red: 0.01183097247, green: 0.4718669041, blue: 0, alpha: 1)
        tool.selectedItem = item1
        tool.items = [item1,item2]
        return tool
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
        view.backgroundColor = .white
        tblViewSetup()
        view.addSubview(tabbar)
        tabbar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight : CGFloat = view.safeAreaInsets.top + 10.0
        myToll.frame = CGRect(x: 0, y: 20, width: view.width, height: toolBarHeight)
        tblview.frame = CGRect(x: 0, y: myToll.bottom + 10, width: view.frame.width, height: view.frame.height)
        let tabbarheight:CGFloat=view.safeAreaInsets.bottom + 70.0
        tabbar.frame = CGRect(x : 0,y : view.height - tabbarheight,width : view.width ,height : tabbarheight )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if tabbar.selectedItem?.title == "Student" {
            studArray = SQLiteHandler.sahred.fetch()
            tblview.reloadData()
        }else{
            NoteArray = SQLiteHandler.sahred.fetchNote()
            tblview.reloadData()
        }
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func ClickAdd(){
        if tabbar.selectedItem?.title == "Student" {
            let register = AddStudent()
            navigationController?.pushViewController(register, animated: true)
        }else{
            let noticevc = AddNotice()
            navigationController?.pushViewController(noticevc, animated: true)
        }
    }
    
    
}
extension AdminView:UITableViewDelegate,UITableViewDataSource {
    func tblViewSetup(){
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "NameCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if tabbar.selectedItem?.title == "Student" {
            return studArray.count
         }else{
            return NoteArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        if tabbar.selectedItem?.title == "Student" {
            let stud = studArray[indexPath.row]
            cell.textLabel?.text = "\(stud.spid) \t | \t \(stud.uname) \t | \t \(stud.gender) | \t \(stud.email) | \t \(stud.div) | \t \(stud.dob)"
        }else{
            let note = NoteArray[indexPath.row]
            cell.textLabel?.text = "\(note.title) | \t  \(note.div)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //UserDefaults.standard.setValue(empArray[indexPath.row], forKey: "listname")
        if tabbar.selectedItem?.title == "Student" {
            let add = AddStudent()
            add.student = studArray[indexPath.row]
            navigationController?.pushViewController(add, animated: true)
        }else{
            let add = AddNotice()
            add.notice = NoteArray[indexPath.row]
            navigationController?.pushViewController(add, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if tabbar.selectedItem?.title == "Student" {
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
        }else{
            let id = NoteArray[indexPath.row].id
            SQLiteHandler.sahred.deleteNote(for: id){
                success in
                if success {
                    print(id)
                    self.NoteArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }else{
                    print("note not delete")
                }
            }
        }
    }
}
extension AdminView: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Student" {
            studArray = SQLiteHandler.sahred.fetch()
            tblview.reloadData()
        }else{
            studArray.removeAll()
            NoteArray = SQLiteHandler.sahred.fetchNote()
            tblview.reloadData()
        }
    }
}
