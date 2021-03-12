//
//  MainViewController.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import UIKit

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
        
        // TODO
    }
}
