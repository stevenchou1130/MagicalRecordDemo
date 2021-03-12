//
//  MainViewController.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import UIKit
import MagicalRecord

class MainViewController: BaseViewController {

    lazy var button: UIButton = {
        let button: UIButton = SCButtonFactory.createButton(with: "Action Button")
        button.addTarget(self, action: #selector(butttonTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        self.view.addSubview(self.button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.button.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(-80)
        }
    }
}

// MARK: - Action
extension MainViewController {
    
    @objc func butttonTapped() {
        
        print("=== butttonTapped")
        
        self.loadData()
    }
    
    /**
     API
     * https://data.gov.tw/dataset/8066
     * https://agridata.coa.gov.tw/api.aspx#operations-tag-%E4%BA%A4%E6%98%93%E8%A1%8C%E6%83%85
     * https://agridata.coa.gov.tw/api/v1/CropType/
     */
    func loadData() {
        
        print("=== loadData")
        
        self.storeData()
    }
    
    func storeData() {
        
        print("=== storeData")
        
    }
}

// MARK: - Private
extension MainViewController {
    
}
