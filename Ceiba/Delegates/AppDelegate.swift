//
//  AppDelegate.swift
//  Ceiba
//
//  Created by Mario Rúa on 9/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    var window: UIWindow?
//    static var diContainer = Container()
//    var rootController: UINavigationController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
//        if(ProcessInfo.processInfo.environment["TEST"] == nil) {
//            DatabaseManager.setup(storageContext: CoreDataStorageContext(configuration: .inMemory(identifier: "Ceiba")))
//        } else {
//            DatabaseManager.setup(storageContext: CoreDataStorageContext())
//        }
//
//        AppDelegate.diContainer.registerDependencies(rootViewController: rootController)
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = rootController
//        window?.makeKeyAndVisible()
//        AppDelegate.diContainer.start()
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
}

