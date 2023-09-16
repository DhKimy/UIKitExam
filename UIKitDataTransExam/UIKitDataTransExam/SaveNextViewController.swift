//
//  SaveNextViewController.swift
//  UIKitDataTransExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class SaveNextViewController: UIViewController {
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textAlignment = .left
        return label
    }()
    
    let emailText: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    let autoUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "자동 갱신"
        label.textAlignment = .left
        return label
    }()
    
    let autoUpdateText: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    let updateIntervalLabel: UILabel = {
        let label = UILabel()
        label.text = "갱신 주기"
        label.textAlignment = .left
        return label
    }()
    
    let updateIntervalText: UILabel = {
        let label = UILabel()
        label.text = "0분마다"
        label.textAlignment = .center
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupValue()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        let stack1 = UIStackView(arrangedSubviews: [emailLabel, emailText])
        stack1.axis = .horizontal
        stack1.spacing = 20
        
        let stack2 = UIStackView(arrangedSubviews: [autoUpdateLabel, autoUpdateText])
        stack2.axis = .horizontal
        stack2.spacing = 20
        
        let stack3 = UIStackView(arrangedSubviews: [updateIntervalLabel, updateIntervalText])
        stack3.axis = .horizontal
        stack3.spacing = 20
        
        let mainStack = UIStackView(arrangedSubviews: [stack1, stack2, stack3, backButton])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.alignment = .fill
        mainStack.distribution = .fill
        view.addSubview(mainStack)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    func setupValue() {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        emailText.text = ad?.paramEmail
        updateIntervalText.text = "\(Int(ad?.paramInterval ?? 0))분마다"
        autoUpdateText.text = (ad?.paramUpdate ?? true) ? "자동 갱신" : "수동 갱신"
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
