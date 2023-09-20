//
//  ViewController.swift
//  UIKitTextFieldExam
//
//  Created by 김동현 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tf = UITextField()
        
        /**
         기본 속성 지정
        */
         
        tf.text = "Sample" // 기본값
        tf.autocapitalizationType = .sentences // 대문자 전환
        tf.autocorrectionType = .no // 자동완성
        tf.spellCheckingType = .no // 틀린 문자열 체크
        tf.keyboardType = .numberPad // 키보드 타입
        tf.keyboardAppearance = .light // 키보드 외형
        tf.returnKeyType = .join // 리턴키 타입
        tf.enablesReturnKeyAutomatically = true // 리턴키 자동활성화
        tf.isSecureTextEntry = true // 비밀번호 포맷 ****
        tf.clearButtonMode = .always // 내부에 클리어 버튼 표시(x버튼으로 삭제하는 것)
        tf.clearsOnBeginEditing = true // 편집 시작시 기존 내용 삭제
        
        // 이외에도 많다. 공식문서를 많이 보자.
        
        /**
         스타일 설정
         */
        
        tf.borderStyle = .line // 테두리 스타일
        tf.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 CGColor이어야 함
        tf.layer.borderWidth = 1.0 // 테두리 두께
        tf.contentVerticalAlignment = .center // 수직 방향 텍스트 배열 위치
        
    }
    
    


}

