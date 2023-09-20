//
//  ViewController.swift
//  NavigationUIKitExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topButtonShow()
        buttomButtonShow()
        view.backgroundColor = .brown
    }
}


// Button 관련 extension
extension ViewController {
    func topButtonShow() {
        let presentMoveButton = UIButton(type: .system)
        presentMoveButton.setTitle("Present 방식으로 이동", for: .normal)
        presentMoveButton.addTarget(self, action: #selector(moveToNext1), for: .touchUpInside)
        presentMoveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentMoveButton)
        NSLayoutConstraint.activate([
            presentMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentMoveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/6)
        ])
    }

    func buttomButtonShow() {
        let navigationMoveButton = UIButton(type: .system)
        navigationMoveButton.setTitle("Navigation 방식으로 이동", for: .normal)
        navigationMoveButton.addTarget(self, action: #selector(moveToNext2), for: .touchUpInside)
        navigationMoveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationMoveButton)
        NSLayoutConstraint.activate([
            navigationMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationMoveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/4) 
        ])
    }
    
    @objc func moveToNext1() {
        let secondVC = LastViewController()
        present(secondVC, animated: true, completion: nil)
    }
    
    @objc func moveToNext2() {
        let secondVC = LastViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}


