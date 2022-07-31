//
//  AppDelegate.swift
//  Teleportation
//
//  Created by Майя Калицева on 31.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var deviceOrientation: UIInterfaceOrientationMask = .portrait
<<<<<<< HEAD
  //  private var tabbar = TabBarCoordinator() // TODO: add tabbar coordinator

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController() // TODO: tabbar calling
=======
 //   private var tabbar = TabBarCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
   //     window?.rootViewController = tabbar.start()
        window?.rootViewController = ViewController()
>>>>>>> xcdeworkspace-
        window?.makeKeyAndVisible()
        return true
    }
}

