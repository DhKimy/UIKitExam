//
//  ViewController.swift
//  UIKitAlertExam
//
//  Created by 김동현 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {

    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
}

// MARK: - UI Component
extension ViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        topLabel()
        bottomButtonShow("기본 알림창 실행", #selector(showAlert1), 0)
        bottomButtonShow("취소, 확인 알림창", #selector(showAlert2), 1)
        bottomButtonShow("3개 이상 항목 알림창", #selector(showAlert3), 2)
        bottomButtonShow("3개 이상 항목 액션시트", #selector(showAlert4), 3)
        bottomButtonShow("3개 이상 항목 핸들러 있는 알림창", #selector(showAlert5), 4)
        bottomButtonShow("TextField 있는 알림창", #selector(showAlert6), 5)
        bottomButtonShow("id, pw 알림창", #selector(showAlert7), 6)
    }
    
    func topLabel() {
        let presentMoveButton = UILabel()
        presentMoveButton.text = result
        presentMoveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentMoveButton)
        NSLayoutConstraint.activate([
            presentMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentMoveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height / 4)
        ])
    }
    

    func bottomButtonShow(_ buttonTitle: String, _ buttonAction: Selector, _ sequence: Int) {
        let navigationMoveButton = UIButton(type: .system)
        navigationMoveButton.setTitle(buttonTitle, for: .normal)
        navigationMoveButton.addTarget(self, action: buttonAction, for: .touchUpInside)
        navigationMoveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationMoveButton)
        NSLayoutConstraint.activate([
            navigationMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationMoveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-view.bounds.height / 6) + CGFloat(sequence * 50))
        ])
    }
    
    
    
}

// MARK: - alert action 모음
extension ViewController {
    /**
     기본 알림창(취소만 있는 것)의 액션 메서드
    */
    @objc func showAlert1() {
        let alert = UIAlertController(
            title: "선택",
            message: "항목을 선택해주세요",
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        
        // 메시지 창 실행
        self.present(alert, animated: true)
        
    }
    
    /**
     기본 알림창(취소, 확인이 있는 것)의 액션 메서드
    */
    @objc func showAlert2() {
        let alert = UIAlertController(
            title: "선택",
            message: "항목을 선택해주세요",
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        let ok = UIAlertAction(
            title: "확인",
            style: .default
        )
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 메시지 창 실행
        self.present(alert, animated: true)
        
    }
    
    /**
     3개 이상의 항목이 있는 Alert의 액션 메서드
    */
    @objc func showAlert3() {
        let alert = UIAlertController(
            title: "선택",
            message: "항목을 선택해주세요",
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        let ok = UIAlertAction(
            title: "확인",
            style: .default
        )
        
        let exec = UIAlertAction(
            title: "실행",
            style: .destructive
        )
        
        let stop = UIAlertAction(
            title: "중지",
            style: .default
        )
        
        // 버튼을 컨트롤러에 등록
        // 취소를 제외한 버튼들은 addAction 등록된 순으로 표시
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 메시지 창 실행
        self.present(alert, animated: true)
        
    }
    
    /**
     3개 이상의 항목이 있는 액션 시트의 액션 메서드
    */
    @objc func showAlert4() {
        let alert = UIAlertController(
            title: "선택",
            message: "항목을 선택해주세요",
            preferredStyle: .actionSheet
        )
        
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        let ok = UIAlertAction(
            title: "확인",
            style: .default
        )
        
        let exec = UIAlertAction(
            title: "실행",
            style: .destructive
        )
        
        let stop = UIAlertAction(
            title: "중지",
            style: .default
        )
        
        // 버튼을 컨트롤러에 등록
        // 취소를 제외한 버튼들은 addAction 등록된 순으로 표시
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 메시지 창 실행
        self.present(alert, animated: true)
        
    }
    
    /**
     handler에 로직을 추가한 Alert의 액션 메서드
     */
    @objc func showAlert5() {
        let alert = UIAlertController(
            title: "선택",
            message: "항목을 선택해주세요",
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel,
            handler: { (_) in
                self.result = "취소 버튼을 클릭했습니다."
            }
        )
        
        let ok = UIAlertAction(
            title: "확인",
            style: .default,
            handler: { (_) in
                self.result = "확인 버튼을 클릭했습니다."
            }
        )
        
        let exec = UIAlertAction(
            title: "실행",
            style: .destructive
        )
        
        let stop = UIAlertAction(
            title: "중지",
            style: .default
        )
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 메시지 창 실행
        self.present(alert, animated: true)
    }
    
    /**
     비밀번호만 입력받는 Alert 창 액션 메서드
     */
    @objc func showAlert6() {
        let title = "카풀 로그인"
        let message = "사용자의 Apple ID dhk767@naver.com의 암호를 입력하세요"
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        let ok = UIAlertAction(
            title: "확인",
            style: .default,
            handler: { (_) in
                // 확인 시 비밀번호를 체크할 로직
            }
        )
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(
            configurationHandler:  { tf in
                tf.placeholder = "암호"
                tf.isSecureTextEntry = true
            }
        )
        self.present(alert, animated: true)
    }
    
    /**
     아이디, 비밀번호를 입력받는 Alert 창 액션 메서드
     */
    @objc func showAlert7() {
        let msg = "로그인"
        let alert = UIAlertController(
            title: nil,
            message: msg,
            preferredStyle: .alert
        )
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        let ok = UIAlertAction(
            title: "확인",
            style: .default,
            handler: { (_) in
                // 확인 시 비밀번호를 체크할 로직
            }
        )
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(
            configurationHandler: { tf in
                tf.placeholder = "아이디"
                tf.isSecureTextEntry = false
            }
        )
        
        alert.addTextField(
            configurationHandler:  { tf in
                tf.placeholder = "암호"
                tf.isSecureTextEntry = true
            }
        )
        self.present(alert, animated: true)
    }
}
