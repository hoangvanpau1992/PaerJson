//
//  DataServices.swift
//  PareJson
//
//  Created by Hoang on 6/15/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import Foundation
class DataServices {
    static let shared: DataServices = DataServices()
    
    func requestAPI() {
        guard let url = URL(string: "https://api.darksky.net/forecast/e029d6bab764ee50e5355299c9809200/37.8267,-122.4233") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        guard let data = data else {return}
                        
                        if let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] {
                            let latitude = json["latitude"] as! Double
                            let dict = ["latitude": latitude]
                            NotificationCenter.default.post(name: NSNotification.Name.init("1"), object: nil, userInfo: dict)
                        } else {
                            print(response.statusCode)
                        }
                    }
                }
            }
            
        }) .resume()
    }
}
