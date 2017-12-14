//
//  AppDelegate.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/03.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?
    
    var isLaunchedByNotification = false
    
    var notificationContentData: NotificationContentData?
    
    func getContentDataFromNotification(content: NSDictionary) -> NotificationContentData? {
        if let alert = content["alert"] as? NSDictionary {
            if let title = alert["title"] as? String, let body = alert["body"] as? String {
                let data = NotificationContentData()
                data.title = title
                data.body = body
                
                return data
            }
        }
        
        return nil
    }
    
    func getViewControllerFromRootViewController(tabbarController: UITabBarController, selectedIndex: Int) -> UIViewController? {
        if let viewControllers = tabbarController.viewControllers {
            if viewControllers.count > selectedIndex {
                return viewControllers[selectedIndex]
            }
        }
        
        return nil
    }
    
    func moveToOtherVC(rootViewController: UITabBarController, selectedIndex: Int) {
        if let viewControllers = rootViewController.viewControllers, viewControllers.count > selectedIndex {
            rootViewController.selectedIndex = selectedIndex
            rootViewController.selectedViewController = viewControllers[selectedIndex]
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("APNs Registration Success")
        
        var token = ""
        
        for i in 0..<deviceToken.count {
            token = token + String(format: "%02.2hhx", arguments: [deviceToken[i]])
        }
        
        print("token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let tabbarController = window?.rootViewController as? UITabBarController {
            let lastIdx = tabbarController.viewControllers!.count - 1
            
            if let destination = getViewControllerFromRootViewController(tabbarController: tabbarController, selectedIndex: lastIdx) as? NotificationContentViewController {
                if let content = userInfo["aps"] as? NSDictionary, let data = getContentDataFromNotification(content: content) {
                    destination.notificationContent = data
                }
                
                moveToOtherVC(rootViewController: tabbarController, selectedIndex: lastIdx)
            }
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let unAuthOptions: UNAuthorizationOptions = [.sound, .alert]
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.requestAuthorization(options: unAuthOptions, completionHandler: { _, _ in })
        notificationCenter.delegate = self
        Messaging.messaging().delegate = self
        
        application.registerForRemoteNotifications()
        FirebaseApp.configure()
        
        // get fcm token
        let fcmToken = Messaging.messaging().fcmToken
        print("FCM token: \(fcmToken ?? "")")
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        let navBar = UINavigationBar.appearance()
        navBar.tintColor = UIColor.white
        navBar.barTintColor = UIColor(red: 71/255, green: 68/255, blue: 59/255, alpha: 0.4)
        
        if let barFont = UIFont(name: "Verdana", size: 25) {
            navBar.titleTextAttributes = [
                NSAttributedStringKey.foregroundColor : UIColor.white,
                NSAttributedStringKey.font : barFont
            ]
        }
        
        if let option = launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as? NSDictionary,
            let content = option["aps"] as? NSDictionary,
            let data = getContentDataFromNotification(content: content) {
            notificationContentData = data
            isLaunchedByNotification = true
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

