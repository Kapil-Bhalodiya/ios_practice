//
//  part1.swift
//  uidemo
//
//  Created by DCS on 09/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class part1: UIViewController {
    
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "hello"
        lbl.backgroundColor = .red
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let myslider:UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self,action: #selector(handleslider),for:.valueChanged)
        return slider
    }()
    
    private let mybtn2:UIButton = {
        let btn2 = UIButton()
        btn2.setTitle("Screen 3", for: .normal)
        btn2.addTarget(self, action: #selector(screen3click), for: .touchUpInside)
        btn2.backgroundColor = .gray
        return btn2
    }()
//    private let mysteper:UISteper = {
//        let steper = UISteper()
//        steper.minimumValue = 0
//        steper.maximumValue = 10
//        slider.addTarget(self,action: #selector(handlesteper),for:.valueChanged)
//        return steper
//    }()
    
    private let mytextfield:UITextField={
        let txtfield = UITextField()
        txtfield.text = ""
        txtfield.backgroundColor = .gray
        txtfield.textAlignment = .center
        return txtfield
    }()
    
    private let mybtn:UIButton={
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.addTarget(self, action: #selector(handleclick), for: .touchUpInside)
        btn.backgroundColor = .cyan
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    private let mydatepicker:UIDatePicker={
        let dtpicker = UIDatePicker()
        dtpicker.datePickerMode = .date
        dtpicker.timeZone = TimeZone(secondsFromGMT: 0)
        dtpicker.addTarget(self, action: #selector(handledatepicker), for: .valueChanged)
        return dtpicker
    }()
    
    
    private let mypageconrol:UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 5
        pc.backgroundColor = .gray
        pc.addTarget(self, action: #selector(handlepagecontrol), for: .valueChanged)
        return pc
    }()
    
    private let mysegement:UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "segment 1", at: 1, animated: true)
        sc.insertSegment(withTitle: "segment 2", at: 2, animated: true)
        sc.insertSegment(withTitle: "segment 3", at: 3, animated: true)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handlesegment), for: .valueChanged)
        return sc
    }()
    
    @objc func handleclick(){
        let nextscreen = part2()
        navigationController?.pushViewController(nextscreen, animated: true)
    }
    @objc func screen3click(){
        let next2screen = part3()
        navigationController?.pushViewController(next2screen, animated: true)
    }
    @objc func handledatepicker(){
        print(mydatepicker.date)
    }
    @objc func handlepagecontrol(){
        print(mypageconrol.currentPage)
    }
    @objc func handlesegment(){
        print(mysegement.selectedSegmentIndex)
    }
    @objc func handleslider(){
        print(myslider.value)
    }
//    @objc func handlesteper(){
//        print(mysteper.value)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "screen 1"
        
        //step 2
        view.addSubview(mylbl)
        view.addSubview(mytextfield)
        view.addSubview(mybtn)
        view.addSubview(mydatepicker)
        view.addSubview(mypageconrol)
        view.addSubview(mysegement)
        view.addSubview(myslider)
        view.addSubview(mybtn2)
//        view.addSubview(mysteper)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //step 3
        mylbl.frame = CGRect(x:20,y:80,width: (view.frame.size.width-40),height: 40)
        mytextfield.frame = CGRect(x:20,y:140,width:(mylbl.frame.size.width),height: 40)
        
        mybtn.frame = CGRect(x:20,y:200,width:view.frame.size.width-60,height:40)
        
        mydatepicker.frame = CGRect(x:20,y:260,width:view.frame.size.width-60,height:40)
        
        mypageconrol.frame = CGRect(x:20,y:300,width:view.frame.size.width-60,height:40)
        mysegement.frame = CGRect(x:20,y:mypageconrol.frame.origin.y + (mypageconrol.frame.height + 100) ,width:view.frame.size.width-60,height:40)
        
        myslider.frame = CGRect(x:20,y:myslider.frame.origin.y + (myslider.frame.height + 100) ,width:view.frame.size.width-60,height:40)
        
         mybtn2.frame = CGRect(x:20,y:mybtn2.frame.origin.y + (myslider.frame.height + 100) ,width:view.frame.size.width-60,height:40)
        
//        mysteper.frame = CGRect(x:20,y:myslider.frame.origin.y + (myslider.frame.height + 100) ,width:view.frame.size.width-60,height:40)
    }
}
