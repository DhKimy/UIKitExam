//
//  LastViewController.swift
//  NavigationUIKitExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class LastViewController: UIViewController {
    
    override func viewDidLoad() {
        
        view.backgroundColor = .darkGray
        
        let label = UILabel()
        label.text = "두 번째 장입니다."
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // 높이, 너비 프레임 설정
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.textAlignment = .center
        
        
        let backButton = UIButton()
        backButton.setTitle("뒤로", for: .normal)
        backButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/3),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/4)
        ])
        
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}
