//
//  SearchVC.swift
//  test_SearchVC
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    private let StateArray = ["MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai","MP","UP","GUJARAT","Mumbai"]
    private let mytable = UITableView()
    private let mySearch = UISearchBar()
    private var searching = false
    
    private var searchdata = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mySearch)
        view.addSubview(mytable)
        
       mySearch.delegate = self
        setTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mySearch.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        mytable.frame = CGRect(x: 0, y: mySearch.frame.origin.y+50, width:view.frame.size.width, height: view.height)
    }
}
extension SearchVC: UITableViewDelegate,UITableViewDataSource{
    private func setTableView(){
        mytable.dataSource = self
        mytable.delegate = self
        mytable.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchdata.count
        }else{
            return StateArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)

        if searching {
            cell.textLabel?.text = searchdata[indexPath.row]
        }else{
        cell.textLabel?.text = StateArray[indexPath.row]
        }
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var title = ""
        if searching{
            title = searchdata[indexPath.row]
        }else{
            title = StateArray[indexPath.row]
        }
        let alert = UIAlertController(title: title, message: "welcome to \(title)", preferredStyle: .alert)
        alert.addAction(UIAlertAction())
    }
}
extension SearchVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            searching = false
        }else{
            searching = true
            searchdata = StateArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
                //$0.lowercased().hasPrefix(searchText.lowercased()) })
        }
        mytable.reloadData()
    }
}
