//
//  AppDelegate.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 07/04/24.
//

import Foundation
import UserNotifications
import SwiftUI


class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Request authorization for notifications
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .criticalAlert]) { granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }
            if granted {
                print("Authorization granted")
                
            } else {
                print("Authorization denied")
            }
        }
        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
//        print("go to background")
//        scheduleBackgroundAlarm()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Cancel any pending notifications when app enters foreground
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

    func scheduleBackgroundAlarm() {
        print("go to background")
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Background Alarm"
        content.body = "Your background alarm is triggered!"
        content.sound = UNNotificationSound.default

        // Create a trigger for the notification (in 10 seconds)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

        // Create a notification request
        let request = UNNotificationRequest(identifier: "background_alarm", content: content, trigger: trigger)

        // Schedule the notification
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Background alarm scheduled")
            }
        }
    }
}
