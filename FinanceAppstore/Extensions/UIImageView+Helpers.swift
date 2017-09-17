//
//  UIImageView+Helpers.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL) { (data, response, error) in
            if error != nil {
                print("\(String(describing: error))")
                return
            }
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                self.image = image
            })
            }.resume()
    }
    
    public func roundedStyle(width: CGFloat) {
        self.layer.cornerRadius = width / 4.5
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
