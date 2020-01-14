//
//  TelstraUtility.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import Foundation


//MARK: Telstra Data Model
struct TelstraDataSet : Decodable {
    var title: String?
    var description:String?
    var imageHref: String?
}
struct TelstraData:Decodable {
    var title : String?
    var rows: [TelstraDataSet]
}

//MARK: Telstra Data Model Manager
class TelstraDataManager: NSObject {
    /// decodes the Telstra metadata JSON and Returns the Telstra Data models in an array.
    static func loadJson(completion: ([TelstraDataSet],String)->()) {
        if let url = URL(string: "https://api.myjson.com/bins/ao19k"){
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
