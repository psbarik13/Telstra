//
//  TelstraTableViewController.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

//MARK: - Telstra Table View Controller Class
class TelstraTableViewController: UIViewController {
    
    var viewModel: TelstraTableViewModel!
    
    //MARK: - Telstra Table View Controller Class veriables
    
    var dataSet : [TelstraDataSet] = []
    let cellId = "cellId"
    var imageDownloader : TelstraImageDownloader?
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TelstraTableViewModel.init(responder: self)
        view.addSubview(tableView)
        addConstraintsToTable()
        tableView.register(TelstraTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        imageDownloader = TelstraImageDownloader()
    }
    
    func addConstraintsToTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         viewModel.loadTelstraData()
    }
}

//MARK: - Extension for Telstra Table View Controller
extension TelstraTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Telstra Tableview data source
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returns the Number of Data Set with valid titles.
        return dataSet.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Returns the Telstra Cell With Proper Data
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TelstraTableViewCell
        let currentItem = dataSet[indexPath.row]
       cell.setData(currentItem)
        return cell
    }
    
    // MARK: - Telstra Tableview Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /// Downloads the images which are being shown on the screen at the moment.
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! TelstraTableViewCell
        let currentItem = dataSet[indexPath.row]
        if let imageUrl = currentItem.imageHref {
            DispatchQueue.global(qos: .default).async {
                self.imageDownloader?.getTelstraImage(with: imageUrl, completionHandler: { (image) in
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil {
                            cell.cellImage.image = image
                        }
                    }
                })
            }
        }
    }
}

extension TelstraTableViewController: TelstraViewResponder {
    func updateData(_ data: [TelstraDataSet]) {
        self.dataSet = data
        DispatchQueue.main.async {
             self.tableView.reloadData()
        }
    }
    
    func updateTitle(_ title: String) {
        DispatchQueue.main.async {
            self.title = title
        }
    }
}
