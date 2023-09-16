//
//  SaveNextViewController.swift
//  UIKitDataTransExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

``class SaveNextViewController: UIViewController {
    
    let emailLabel = createLabel(withText: "이메일")
    let emailText = createLabel(textAlignment: .center)
    
    let autoUpdateLabel = createLabel(withText: "자동 갱신")
    let autoUpdateText = createLabel(textAlignment: .center)
    
    let updateIntervalLabel = createLabel(withText: "갱신 주기")
    let updateIntervalText = createLabel(textAlignment: .center)
    
    let backButton = createButton(withTitle: "Back", cornerRadius: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupValue()
    }
    
    func setupUI() {
        let stack1 = SaveNextViewController.createHorizontalStackView(arrangedSubviews: [emailLabel, emailText])
        let stack2 = SaveNextViewController.createHorizontalStackView(arrangedSubviews: [autoUpdateLabel, autoUpdateText])
        let stack3 = SaveNextViewController.createHorizontalStackView(arrangedSubviews: [updateIntervalLabel, updateIntervalText])
        
        let mainStack = SaveNextViewController.createVerticalStackView(arrangedSubviews: [stack1, stack2, stack3, backButton])
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
        
        if let email = ad?.paramEmail {
            emailText.text = email
        }
        
        if let update = ad?.paramInterval {
            updateIntervalText.text = "\(Int(update))분마다"
        }
        
        if let auto = ad?.paramUpdate {
            autoUpdateText.text = auto ? "자동 갱신" : "수동 갱신"
        }
    }
    
    // Helper methods (moved from your original code)
    static func createLabel(withText text: String? = nil, textAlignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = textAlignment
        return label
    }
    
    static func createButton(withTitle title: String, cornerRadius: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        return button
    }
    
    static func createHorizontalStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }
    
    static func createVerticalStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }
}

