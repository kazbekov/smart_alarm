//
//  AppDelegate.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/28/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let alarmScheduler: AlarmSchedulerDelegate = Scheduler()
    var alarmModel: Alarms = Alarms()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let otherVC = sb.instantiateViewController(withIdentifier: "otherVC") as! GameViewController
        window?.rootViewController = otherVC;
        
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        var index: Int = -1
        var soundName: String = ""
        if let userInfo = notification.userInfo {
            soundName = userInfo["soundName"] as! String
            index = userInfo["index"] as! Int
        }
        self.alarmModel = Alarms()
        self.alarmModel.alarms[index].onSnooze = false
        if identifier == Id.snoozeIdentifier {
            alarmScheduler.setNotificationForSnooze(snoozeMinute: 1, soundName: soundName, index: index)
            self.alarmModel.alarms[index].onSnooze = true
        }
        completionHandler()
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let otherVC = sb.instantiateViewController(withIdentifier: "otherVC") as! GameViewController
        window?.rootViewController = otherVC;
    }


}

