//
//  NotificationCenterViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation

let changeColorNotification = Notification.Name("backgeoundChangeColorNotification")

class NotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: changeColorNotification, object: nil)
    }
    
    @objc
    private func changeColor(notification: Notification) {
        
        guard let color = notification.userInfo?["color"] as? UIColor else { return }
        
        view.backgroundColor = color
    }
    
    
    @IBAction func sendNotifiationAction(_ sender: Any) {
        
        let color = UIColor.red
        
        NotificationCenter.default.post (name: changeColorNotification, object: nil, userInfo: ["color": color])
    }
}
