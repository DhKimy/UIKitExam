//
//  RootViewController.swift
//  UIKitDataTransExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        topButtonShow()
        bottomButtonShow()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RootViewController {
    func topButtonShow() {
        let presentMoveButton = UIButton(type: .system)
        presentMoveButton.setTitle("간접 전달 방식", for: .normal)
        presentMoveButton.addTarget(self, action: #selector(moveToNext1), for: .touchUpInside)
        presentMoveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentMoveButton)
        NSLayoutConstraint.activate([
            presentMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentMoveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/6)
        ])
    }

    func bottomButtonShow() {
        let navigationMoveButton = UIButton(type: .system)
        navigationMoveButton.setTitle("직접 전달 방식", for: .normal)
        navigationMoveButton.addTarget(self, action: #selector(moveToNext2), for: .touchUpInside)
        navigationMoveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationMoveButton)
        NSLayoutConstraint.activate([
            navigationMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationMoveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/4)
        ])
    }
    
    @objc func moveToNext1() {
        let secondVC = SaveDataViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func moveToNext2() {
        let secondVC = ViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
