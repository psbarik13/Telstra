//
//  TelstraImageDownloader.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 14/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Telstra Image Downloader Class Declaration
/// Used to Download image from given url and save the image in cache for further use
class TelstraImageDownloader {
    
    //MARK: - Testra Image Downloader Class veriables
    var task : URLSessionDataTask?
    var session : URLSession?
    var cache : NSCache<NSString, UIImage>?
    /// Telstra Image Downloader initializer
    init() {
        task = URLSessionDataTask()
        session = URLSession.shared
        cache = NSCache()
    }
    
    ///Get Telstra Image with the URL path and save the image in the cache
    func getTelstraImage(with path: String, completionHandler: @escaping ((UIImage?) -> ())) {
        if let image = self.cache?.object(forKey: path as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            guard let url = URL(string: path) else {completionHandler(nil);return}
            task = session?.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let imageData = data else {completionHandler(nil);return}
                guard let image = UIImage(data: imageData) else {completionHandler(nil);return}
                self.cache?.setObject(image, forKey: path as NSString)
                DispatchQueue.main.async {
                    completionHandler(image)
                }
            })
            task?.resume()
        }
    }
}
