//
//  ViewController.swift
//  UIKitDataTransExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textAlignment = .left
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일을 입력하세요"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let autoUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "자동 갱신"
        label.textAlignment = .left
        return label
    }()
    
    let autoUpdateText: UILabel = {
        let label = UILabel()
        label.text = "자동 갱신"
        label.textAlignment = .center
        return label
    }()
    
    
    let autoUpdateSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        return switchControl
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
    
    let updateIntervalStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 60
        stepper.stepValue = 1
        return stepper
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        //TextField Delegate Setting
        emailTextField.delegate = self
    }
    
    func setupUI() {
        let stack1 = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stack1.axis = .horizontal
        stack1.spacing = 20
        
        let stack2 = UIStackView(arrangedSubviews: [autoUpdateLabel, autoUpdateText, autoUpdateSwitch])
        stack2.axis = .horizontal
        stack2.spacing = 20
        
        let stack3 = UIStackView(arrangedSubviews: [updateIntervalLabel, updateIntervalText, updateIntervalStepper])
        stack3.axis = .horizontal
        stack3.spacing = 20
        
        let mainStack = UIStackView(arrangedSubviews: [stack1, stack2, stack3])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.alignment = .fill
        mainStack.distribution = .fill
        view.addSubview(mainStack)
        view.addSubview(submitButton)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        updateIntervalStepper.addTarget(self, action: #selector(updateIntervalChanged), for: .valueChanged)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        autoUpdateSwitch.addTarget(self, action: #selector(onUpdateSwitch), for: .touchUpInside)
    }
    
    @objc func updateIntervalChanged() {
        let minutes = Int(updateIntervalStepper.value)
        updateIntervalText.text = "\(minutes)분마다"
    }
    
    @objc func submitButtonTapped() {
        // Handle submit button tap event
        let nextViewController = NextViewController()
        
        nextViewController.emailTextValue = emailTextField.text
        nextViewController.autoUpdateTextValue = autoUpdateText.text
        nextViewController.updateIntervalTextValue = updateIntervalText.text
        
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    @objc func onUpdateSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.autoUpdateText.text = "자동 갱신"
        } else {
            self.autoUpdateText.text = "수동 갱신"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 리턴 키를 눌렀을 때 호출되는 메서드
        // 여기서 키보드를 숨깁니다.
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 화면의 다른 부분을 탭했을 때 호출되는 메서드
        // 여기서 키보드를 숨깁니다.
        view.endEditing(true)
    }
}
