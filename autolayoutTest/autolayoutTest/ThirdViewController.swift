//
//  ThirdViewController.swift
//  autolayoutTest
//
//  Created by fedir on 07.07.2021.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
    
    //MARK: - properties
    
    let multipler: CGFloat = 0.8
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("return", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(returnToPrevious), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     setupUI()
    }
    
    //MARK: - actions
    
    @objc func returnToPrevious() {
        self.dismiss(animated: true , completion: nil)
    }
    
    
    
}

//MARk: - setupUI

private extension ThirdViewController {
    
    private func setupUI() {
        let redView = createView(backGroundColor: .red)
        view.addSubview(redView)
        redView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(multipler)
            $0.width.equalToSuperview().multipliedBy(multipler)
            $0.center.equalToSuperview()
        }
        
        let yellowView = createView(backGroundColor: .yellow)
        redView.addSubview(yellowView)
        yellowView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(multipler)
            $0.width.equalToSuperview().multipliedBy(multipler)
            $0.center.equalToSuperview()
        }
        
        let greenView = createView(backGroundColor: .green)
        yellowView.addSubview(greenView)
        greenView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(multipler)
            $0.width.equalToSuperview().multipliedBy(multipler)
            $0.center.equalToSuperview()
        }
        
        let blueView = createView(backGroundColor: .blue)
        greenView.addSubview(blueView)
        blueView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(multipler)
            $0.width.equalToSuperview().multipliedBy(multipler)
            $0.center.equalToSuperview()
        }
        
        blueView.addSubview(button)
        button.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(multipler)
            $0.width.equalToSuperview().multipliedBy(multipler)
            $0.center.equalToSuperview()
        }
    }
}
