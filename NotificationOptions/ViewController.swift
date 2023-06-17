//
//  ViewController.swift
//  NotificationOptions
//
//  Created by Sudeb on 17/06/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setNotifications(){
        let debitOverdraftNotifCategory = UNNotificationCategory(identifier: "testNotificationWithOption", actions: [], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([debitOverdraftNotifCategory])
    }
    
    
    @IBAction func setNotificationButtonTapped(sender : UIButton) {
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            guard settings.authorizationStatus == .authorized else { return }
            
            let content = UNMutableNotificationContent()
            content.categoryIdentifier = "testNotificationWithOption"
            content.title = "New Message"
            content.body = "You have received one new message !!!"
            content.sound = UNNotificationSound.default
           
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}

