//
//  TelstraTableViewCell.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

//MARK:- Telstra TableView Cell Class Declaration
class TelstraTableViewCell: UITableViewCell {
    //Mark:- Telstra TableView Cell UI Components declaration
    /// Telstra Cell Title Text
    let cellTitle = UILabel()
    
    /// Telstra Cell Description Text View
    let cellDescription : UITextView = {
        // Initial Settings for the cell Text View
        let description = UITextView()
        description.font = UIFont.systemFont(ofSize: 14)
        description.isEditable = false
        description.isSelectable = false
        return description
    }()
    
    /// Telstra Cell Image
    let cellImage : UIImageView = {
        // Initial Settings for the cell Image View
        let imageView = UIImageView(image: UIImage(named: "noImg"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK:- Telstra TableView Cell Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        // UI Components added to the Cell
        addSubview(cellTitle)
        addSubview(cellDescription)
        addSubview(cellImage)
        
        // Constraints added to the UI components inside the cell
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cellImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        cellTitle.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 20).isActive = true
        cellTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5).isActive = true
        cellDescription.leadingAnchor.constraint(equalTo: cellTitle.leadingAnchor).isActive = true
        cellDescription.trailingAnchor.constraint(equalTo: cellTitle.trailingAnchor).isActive = true
        cellDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
