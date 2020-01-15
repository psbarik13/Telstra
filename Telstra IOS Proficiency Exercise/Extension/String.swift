//
//  File.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barikon 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

extension String {
    /// Returns Height of the Label
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}
