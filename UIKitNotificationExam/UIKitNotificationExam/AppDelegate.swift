//
//  AppDelegate.swift
//  UIKitNotificationExam
//
//  Created by 김동현 on 2023/09/17.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 알림 권한 요청
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, error) in
            if didAllow {
                print("알림 권한이 허용되었습니다.")
            } else {
                print("알림 권한이 거부되었습니다.")
            }
        }
        notiCenter.delegate = self // 사용자가 알림 메시지 클릭할 때 이벤트 전달받기
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    /**
     앱이 활성화 상태를 잃었을 때 실행되는 메서드
     앱을 사용하는 도중 전화가 오거나 SMS가 도착하는 경우, 인디케이터를 올려 홈화면으로 갔을 경우가 대표적
     이러한 때에 메서드가 호출된다.
     */
    func applicationWillResignActive(_ application: UIApplication) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                // 알림 컨텐츠 객체
                let nContent = UNMutableNotificationContent()
                nContent.badge = 1
                nContent.title = "로컬 알림 메시지"
                nContent.subtitle = "준비된 내용이 많아요. 앱을 다시 열어주세요."
                nContent.body = "왜나갔어요 다시 들어와요"
                nContent.sound = UNNotificationSound.default
                nContent.userInfo = ["name": "배찌"]
                
                // 알림 발송 조건 객체
                let trigger = UNTimeIntervalNotificationTrigger(
                    timeInterval: 5,
                    repeats: false
                )
                
                // 알림 요청 객체
                let request = UNNotificationRequest(
                    identifier: "wakeup",
                    content: nContent,
                    trigger: trigger
                )
                
                // Notification Center에 추가
                UNUserNotificationCenter.current().add(request)
            } else {
                print("사용자 알림 미동의")
            }
        }
    }
    
    // 사용자가 알림 메시지를 클릭했을 경우
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        
        completionHandler()
    }
    
    
    // 앱 실행도중 알림 메시지가 도착한 경우
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        
        // 알림 배너 띄워주기
        completionHandler([.alert, .badge, .sound])
    }
}

