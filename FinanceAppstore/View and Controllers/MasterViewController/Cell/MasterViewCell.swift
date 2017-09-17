//
//  MasterViewCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 16/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class MasterViewCell: UITableViewCell {
    @IBOutlet weak var ranking: UILabel?
    @IBOutlet weak var appImage: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var category: UILabel?

    var item: AppstoreItem? {
        didSet {
            guard let item = item else {
                return
            }
            
            appImage?.imageFromURL(urlString: item.thumbnailURL!)
            title?.text = item.title
            category?.text = item.category
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appImage?.roundedStyle(width: self.frame.height)
    }
}
