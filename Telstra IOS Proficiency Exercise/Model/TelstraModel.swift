//
//  TelstraUtility.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import Foundation
import UIKit

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
