//
//  ViewController.swift
//  UIKitDataTransExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // UI 요소들 정의
    let emailLabel = createLabel(withText: "이메일")
    let emailTextField = createTextField(withPlaceholder: "이메일을 입력하세요", keyboardType: .emailAddress)
    
    let autoUpdateLabel = createLabel(withText: "자동 갱신")
    let autoUpdateText = createLabel(withText: "자동 갱신", textAlignment: .center)
    let autoUpdateSwitch = UISwitch()
    
    let updateIntervalLabel = createLabel(withText: "갱신 주기")
    let updateIntervalText = createLabel(withText: "0분마다", textAlignment: .center)
    let updateIntervalStepper = createStepper()
    
    let submitButton = createButton(withTitle: "Submit", backgroundColor: .systemPink, cornerRadius: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        emailTextField.delegate = self
    }
    
    func setupUI() {
        let stack1 = ViewController.createHorizontalStackView(arrangedSubviews: [emailLabel, emailTextField])
        let stack2 = ViewController.createHorizontalStackView(arrangedSubviews: [autoUpdateLabel, autoUpdateText, autoUpdateSwitch])
        let stack3 = ViewController.createHorizontalStackView(arrangedSubviews: [updateIntervalLabel, updateIntervalText, updateIntervalStepper])
        
        let mainStack = ViewController.createVerticalStackView(arrangedSubviews: [stack1, stack2, stack3, submitButton])
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        updateIntervalStepper.addTarget(self, action: #selector(updateIntervalChanged), for: .valueChanged)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        autoUpdateSwitch.addTarget(self, action: #selector(onUpdateSwitch), for: .valueChanged)
        autoUpdateSwitch.isOn = true
    }
    
    @objc func updateIntervalChanged() {
        let minutes = Int(updateIntervalStepper.value)
        updateIntervalText.text = "\(minutes)분마다"
    }
    
    @objc func submitButtonTapped() {
        let nextViewController = NextViewController()
        
        nextViewController.emailTextValue = emailTextField.text
        nextViewController.autoUpdateTextValue = autoUpdateText.text
        nextViewController.updateIntervalTextValue = updateIntervalText.text
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func onUpdateSwitch() {
        let switchText = autoUpdateSwitch.isOn ? "자동 갱신" : "수동 갱신"
        autoUpdateText.text = switchText
    }
    
    // UITextFieldDelegate 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Helper 메서드
    static func createLabel(withText text: String, textAlignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = textAlignment
        return label
    }
    
    static func createTextField(withPlaceholder placeholder: String, keyboardType: UIKeyboardType) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.borderStyle = .roundedRect
        return textField
    }
    
    static func createStepper() -> UIStepper {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 60
        stepper.stepValue = 1
        return stepper
    }
    
    static func createButton(withTitle title: String, backgroundColor: UIColor, cornerRadius: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(.white, for: .normal)
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

