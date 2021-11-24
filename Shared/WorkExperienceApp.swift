//
//  WorkExperienceApp.swift
//  Shared
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application:  UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct WorkExperienceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
