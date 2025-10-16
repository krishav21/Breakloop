//
// TimerManager.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI
import Observation
import UserNotifications

@Observable @MainActor
final class TimerManager {
    var screenTime: TimeInterval = 30 * 60
    var previousScreenTime: TimeInterval = 0
    
    var activityTime: TimeInterval = 10 * 60
    var previousActivityTime: TimeInterval = 0
    
    var timer: Timer?
    var hasTimerStarted: Bool = false
    var isOnActivity: Bool = false
    
    var activities: [Activity] = Array(Activity.all.shuffled().prefix(10))
    
    var timeProgress: Double {
        if !isOnActivity {
            return screenTime / 3600
        } else {
            return activityTime / 3600
        }
    }
    
    var time: TimeInterval {
        if !isOnActivity {
            return screenTime
        } else {
            return activityTime
        }
    }
    
    var timerText: String {
        if !isOnActivity {
            return "Allowed Screen Time"
        } else {
            return "Activity Time"
        }
    }
    
    func startTimer() {
        hasTimerStarted = true
        previousScreenTime = screenTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                withAnimation(.spring) { self.countDown() }
            }
        }
    }
    
    func countDown() {
        if !isOnActivity {
            if screenTime > 0 {
                screenTime -= 1
            } else {
                previousActivityTime = activityTime
                isOnActivity = true
            }
        } else {
            if activityTime > 0 {
                activityTime -= 1
            } else {
                if let first = activities.first {
                    activities.removeFirst()
                    activities.append(first)
                }
                
                sendNotification()
                
                screenTime = previousScreenTime
                activityTime = previousActivityTime
                
                isOnActivity = false
            }
        }
    }
    
    func restartTimer() {
        withAnimation(.spring) {
            timer?.invalidate()
            timer = nil
            screenTime = previousScreenTime
            activityTime = previousActivityTime
            hasTimerStarted = false
            isOnActivity = false
        }
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = activities[0].title
        content.body = activities[0].description
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let id: String = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func requestForNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error { print(error.localizedDescription) }
        }
    }
}
