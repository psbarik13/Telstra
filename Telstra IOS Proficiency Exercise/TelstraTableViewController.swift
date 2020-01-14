//
//  TelstraTableViewController.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

//MARK: - Telstra Table View Controller Class
class TelstraTableViewController: UITableViewController {
    
    //MARK: - Telstra Table View Controller Class veriables
    
    var dataSet : [TelstraDataSet] = []
    let cellId = "cellId"
    var imageDownloader : TelstraImageDownloader?
    
    //MARK: - Telstra Table View member functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTelstraData()
        tableView.register(TelstraTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        imageDownloader = TelstraImageDownloader()
    }
    
    ///Downloads Telstra JSON dataset and ready it for the tableview
    func loadTelstraData() {
        TelstraDataManager.loadJson(completion: { (dataSet, title) in
            self.dataSet = dataSet.filter({$0.title != nil})
            self.title = title
            tableView.reloadData()
        })
    }
}

//MARK: - Extension for Telstra Table View Controller
extension TelstraTableViewController {
    
    // MARK: - Telstra Tableview data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returns the Number of Data Set with valid titles.
        return dataSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Returns the Telstra Cell With Proper Data
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TelstraTableViewCell
        let currentItem = dataSet[indexPath.row]
        cell.cellTitle.text = currentItem.title
        cell.cellDescription.text = currentItem.description
        cell.cellImage.image = UIImage(named: "noImg")
        return cell
    }
    
    // MARK: - Telstra Tableview Delegates
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentItem = dataSet[indexPath.row]
        guard let heightOfDescription = currentItem.description?.height(withConstrainedWidth: tableView.frame.width, font: UIFont.systemFont(ofSize: 16)) else {return 100}
        return heightOfDescription + 100
    }
    
    /// Downloads the images which are being shown on the screen at the moment.
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! TelstraTableViewCell
        let currentItem = dataSet[indexPath.row]
        if let imageUrl = currentItem.imageHref {
            DispatchQueue.global(qos: .default).async {
                self.imageDownloader?.getTelstraImage(with: imageUrl, completionHandler: { (image) in
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil {
                            print(indexPath.row)
                            print(imageUrl)
                            cell.cellImage.image = image
                        }
                    }
                })
            }
        }
    }
}
