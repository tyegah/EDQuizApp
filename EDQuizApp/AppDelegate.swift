//
//  AppDelegate.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 06/05/22.
//

import UIKit
import EDGameEngine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let resultViewController = ResultViewController(summary: "You got 1/2 answers correct", answers: [AnswerViewModel(question: "Question 1??", answer: "You got this correct", wrongAnswer: nil), AnswerViewModel(question: "Question 2??", answer: "You got this wrong!", wrongAnswer: "The wrong answer")])
        window?.rootViewController = UINavigationController(rootViewController: resultViewController)
        window?.makeKeyAndVisible()
        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

