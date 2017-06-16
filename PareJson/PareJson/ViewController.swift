//
//  ViewController.swift
//  PareJson
//
//  Created by Hoang on 6/15/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    // latitude

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name.init("1"), object: nil)
        DataServices.shared.requestAPI()
    }
    
    func handleNotification(_ notificaion: Notification) {
        let dict = notificaion.userInfo as! [String: Double]
        let latitude = dict["latitude"]
        DispatchQueue.main.async {
            self.label.text = "\(latitude)"
        }
    }
}

