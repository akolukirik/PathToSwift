//
//  AppDelegate.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        AppRouter.shared.start()
        return true
    }
}
