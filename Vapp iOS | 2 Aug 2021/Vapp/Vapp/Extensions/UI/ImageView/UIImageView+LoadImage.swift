//
//  UIImageView+LoadImage.swift
//  Vapp
//
//  Created by Roman Romanenko on 10/2/19.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    
    func loadImageUsingCache(withUrl urlString : String) -> URLSessionDataTask? {
        
        let url = URL(string: urlString)
        if url == nil { return nil }
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return nil
        }
        
        let spinner = UIActivityIndicatorView.init(style: .medium)        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        self.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    spinner.removeFromSuperview()
                }
            }
            
        })
        task.resume()
        
        return task
    }
}
