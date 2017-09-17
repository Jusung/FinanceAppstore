//
//  DetailViewGeneralInfoCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class DetailViewGeneralInfoCell: UITableViewCell {
    @IBOutlet weak var appImage: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var author: UILabel?

    var item: DetailViewModelItem? {
        didSet {
            guard let item = item as? DetailViewModelProfileItem else {
                return
            }
            
            appImage?.imageFromURL(urlString: item.thumbnailURL)
            title?.text = item.title
            author?.text = item.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        appImage?.roundedStyle(width: self.frame.height)
    }

    static var identifier: String {
        return String(describing: self)
    }
}
