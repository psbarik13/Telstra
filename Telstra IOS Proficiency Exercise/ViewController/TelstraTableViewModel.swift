//
//  TelstraTableViewModel.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

protocol TelstraViewResponder {
    func updateData(_ data: [TelstraDataSet])
    func updateTitle(_ title: String)
}

class TelstraTableViewModel {
    let responder: TelstraViewResponder
    
    init(responder: TelstraViewResponder) {
        self.responder = responder
    }
}

extension TelstraTableViewModel {
    ///Downloads Telstra JSON dataset and ready it for the tableview
    func loadTelstraData() {
        TelstraDataManager.loadJson(completion: { (dataSet, title) in
            responder.updateData(dataSet.filter( { $0.title != nil }))
            responder.updateTitle(title)
        })
    }
}
