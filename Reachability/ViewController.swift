//
//  ViewController.swift
//  Reachability
//
//  Created by Amol on 8/18/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var reachability: Reachability? = Reachability.networkReachabilityForInternetConnection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityDidChange(_:)), name: NSNotification.Name(rawValue: ReachabilityDidChangeNotificationName), object: nil)
        
        _ = reachability?.startNotifier()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        reachability?.stopNotifier()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkReachability()
    }
    
    func checkReachability() {
        guard let r = reachability else {
            return
        }
        if r.isReachable  {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    @objc func reachabilityDidChange(_ notification: Notification) {
        checkReachability()
    }
    
    
}

