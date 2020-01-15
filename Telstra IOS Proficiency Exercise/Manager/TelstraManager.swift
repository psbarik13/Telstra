//
//  TelstraManager.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

//MARK: Telstra Data Model Manager
class TelstraDataManager: NSObject {
    
   static let dataUrlString = "https://api.myjson.com/bins/ao19k"
    
    /// decodes the Telstra metadata JSON and Returns the Telstra Data models in an array.
    static func loadJson(completion: ([TelstraDataSet],String)->()) {
        if let url = URL(string: dataUrlString){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TelstraData.self, from: data)
                completion(jsonData.rows, jsonData.title ?? "")
            } catch {
                print("error:\(error)")
                completion([],"")
            }
        }
    }
}

