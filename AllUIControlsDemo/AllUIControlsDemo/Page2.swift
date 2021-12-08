//
//  Page2.swift
//  AllUIControlsDemo
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Page2: UIViewController {
    
    private let imgPicker = UIImagePickerController()
    
    private let imgView : UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 05
        imgview.image = UIImage(named: ((UserDefaults.standard.string(forKey: "listname") ?? nil) ?? nil)!)
        imgview.clipsToBounds = true
        return imgview
    }()
    
    private var PageContol : UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 2
        pc.backgroundColor = UIColor.cyan
        pc.currentPage = 1
        pc.tintColor = .gray
        return pc
    }()
    
    private let Titlelbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Register"
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 60)
        lbl.font = UIFont(name: "Arial", size: 50)
        return lbl
    }()
    
    private let nametxtFeild: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter Email"
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let txtView : UITextView = {
        let txtname = UITextView()
        txtname.text = "DOB :"
        txtname.font = UIFont.boldSystemFont(ofSize: 15)
        return txtname
    }()
    
    private let mySegment : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Male", at: 0, animated: true)
        sc.insertSegment(withTitle: "Female", at: 1, animated: true)
        sc.insertSegment(withTitle: "Transgender", at: 2, animated: true)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private let DatePicker : UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.datePickerMode = UIDatePicker.Mode.date
        return dp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(PageContol)
        view.addSubview(nametxtFeild)
        view.addSubview(Titlelbl)
        view.addSubview(DatePicker)
        view.addSubview(txtView)
        view.addSubview(mySegment)
        view.addSubview(imgView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Titlelbl.frame = CGRect(x: 50, y: 30, width: view.width - 100, height: 60)
        nametxtFeild.frame = CGRect(x: 30, y: Titlelbl.bottom + 30, width: view.width-60, height: 40)
        txtView.frame = CGRect(x: 20, y: nametxtFeild.bottom + 20, width: 60, height: 70)
        DatePicker.frame = CGRect(x: txtView.left+30, y: nametxtFeild.bottom + 10, width:view.width-20, height: 60)
        mySegment.frame = CGRect(x: 20, y: DatePicker.bottom+20, width: view.width-40, height: 50)
        imgView.frame = CGRect(x: 20, y: 200, width: 200, height: 50)
        PageContol.frame = CGRect(x: 100, y: 610, width: view.width - 200, height: 30)
    }
}

extension Page2 : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let get = info[.originalImage] as? UIImage{
            
        }
    }
}
