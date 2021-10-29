//
//  part2.swift
//  uidemo
//
//  Created by DCS on 22/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class part2: UIViewController {
    
    private let myprogess : UIProgressView = {
        let progress = UIProgressView()
        progress.setProgress(0.5, animated: true)
        return progress
    }()
    
    private let pv = UIPickerView()
    
    private let pd = ["1","2","3"]
    
    private let loader : UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        load.color = .gray
        return load
    }()
    
    private let myimg : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = false
        img.image = UIImage(named: "img.jpg")
        return img
    }()
    
    private let mybtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.addTarget(self, action: #selector(handleclick), for: .touchUpInside)
        btn.backgroundColor = .cyan
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Screen 2"
        lbl.backgroundColor = .green
        lbl.textAlignment = .center
        return lbl
    }()

    @objc func handleclick(){
        print(loader.isAnimating)
        DispatchQueue.main.async {
            self.loader.isHidden = !self.loader.isHidden
            self.loader.isHidden ? self.loader.stopAnimating() : self.loader.startAnimating()
        }
    }
    
    //didappear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0) {
            self.myprogess.setProgress(1.0, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "screen 2"
        view.backgroundColor = .white
        view.addSubview(mylbl)
        view.addSubview(mybtn)
        view.addSubview(loader)
        view.addSubview(myimg)
        view.addSubview(pv)
        view.addSubview(myprogess)
        pv.dataSource = self
        pv.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mylbl.frame = CGRect(x: 20, y: 100, width:
            view.frame.size.width - 40, height: 60)
        
        loader.frame = CGRect(x: 20, y: 150, width: view.frame.size.width - 40, height: 60)
        
        mybtn.frame = CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 60)
        
        myimg.frame = CGRect(x: 20, y: 250, width: view.frame.size.width - 40, height: 60)
        
        pv.frame = CGRect(x: 100, y: 300, width: view.frame.size.width - 200, height: 100)
        myprogess.frame = CGRect(x: 100, y: 450, width: view.frame.size.width - 200, height: 100)
    }

}
extension part2 : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pd.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pd[row]
    }
}
