//
//  NotificationViewController.swift
//  NotificationContentAppExtension
//
//  Created by Sudeb on 17/06/23.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }
    
     
    @IBAction func yesButtonTapped(_ sender: Any) {
        print("YES button tapped.")
 
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        print("NO  button tapped.")
    }
    
}
