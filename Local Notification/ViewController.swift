//
//  ViewController.swift
//  Local Notification
//
//  Created by Oğuz Karatoruk on 21.01.2020.
//  Copyright © 2020 Oğuz Karatoruk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleLocalNotification(hour: 09, minute: 05, title: "LOCAL NOTIFICATION", body: "github.com/oguzkr")
    }
    
    func registerLocalNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Success")
            } else {
                print("Error")
            }
        }
    }

    func scheduleLocalNotification(hour:Int, minute:Int, title:String, body:String) {
        registerLocalNotification()
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = "notification"
        content.userInfo = ["key": "data"]
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 52
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }


}

