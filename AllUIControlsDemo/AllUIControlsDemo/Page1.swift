//
//  Page1.swift
//  AllUIControlsDemo
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Page1: UIViewController {
    private var PageContol : UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 2
        pc.currentPage = 0
        pc.tintColor = .gray
        pc.addTarget(self, action: #selector(NextPage), for: .valueChanged)
        return pc
    }()
    private let GetStartBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        btn.layer.cornerRadius = 30
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg_UI")!)
        view.addSubview(GetStartBtn)
        view.addSubview(PageContol)
    }
    @objc func NextPage(){
        clicked()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        GetStartBtn.frame = CGRect(x: 30, y: view.bottom - 100, width: view.width-60, height: 50)
        PageContol.frame = CGRect(x: 100, y: GetStartBtn.bottom + 10, width: view.width - 200, height: 30)
    }
    @objc func clicked(){
        PageContol.currentPage += 1
        let p2 = Page2()
        navigationController?.pushViewController(p2, animated: true)
        present(p2, animated: true, completion: nil)
    }
}
