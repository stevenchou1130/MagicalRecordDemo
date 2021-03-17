//
//  MainViewController.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import UIKit
import MagicalRecord

class MainViewController: BaseViewController {

    lazy var storeButton: UIButton = {
        let button: UIButton = SCButtonFactory.createButton(with: "Store a user")
        button.addTarget(self, action: #selector(storeBtnTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    lazy var fetchButton: UIButton = {
        let button: UIButton = SCButtonFactory.createButton(with: "Fetch a user")
        button.addTarget(self, action: #selector(fetchBtnTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    lazy var removeDBButton: UIButton = {
        let button: UIButton = SCButtonFactory.createButton(with: "Remove DB")
        button.addTarget(self, action: #selector(removeDBBtnTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        self.view.addSubview(self.storeButton)
        self.view.addSubview(self.fetchButton)
        self.view.addSubview(self.removeDBButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.storeButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.snp_topMargin).offset(120)
        }
        
        self.fetchButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.storeButton.snp_bottomMargin).offset(40)
        }
        
        self.removeDBButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.fetchButton.snp_bottomMargin).offset(40)
        }
    }
}

// MARK: - Action
extension MainViewController {
    
    @objc func storeBtnTapped() {

        let user = self.createUser()
        self.storeData(with: user)
    }
    
    func createUser() -> User {
        
        let id = String(Int.random(in: 1...99999))
        let name = "測試者\(id)"
        let age = Int.random(in: 18...50)
        let city = ["台北市", "新北市", "桃園市", "台中市", "台南市", "高雄市"].randomElement()!
        
        return User(id: id, name: name, age: age, address: ["city": city])
    }
    
    func storeData(with user: User) {
        
        DBHelper.shared.store(user: user)
    }
}

// MARK: - Fetch
extension MainViewController {
    
    @objc func fetchBtnTapped() {
        
        self.fetchUser()
    }
    
    func fetchUser() {
        
        DBHelper.shared.fetch()
    }
}

// MARK: - Remove DB
extension MainViewController {
    
    @objc func removeDBBtnTapped() {
        
        self.removeDB()
    }
    
    func removeDB() {
        
        DBHelper.shared.cleanAndResetupDB()
    }
}

// MARK: - Private
extension MainViewController {
    
    /*
     * API for testing
     * https://data.gov.tw/dataset/8066
     * https://agridata.coa.gov.tw/api.aspx#operations-tag-%E4%BA%A4%E6%98%93%E8%A1%8C%E6%83%85
     * https://agridata.coa.gov.tw/api/v1/CropType/
     */
}
