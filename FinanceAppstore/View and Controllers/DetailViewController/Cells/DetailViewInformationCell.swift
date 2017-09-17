//
//  DetailViewInformationCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class DetailViewInformationCell: UITableViewCell {
    @IBOutlet weak var developer: UILabel?
    @IBOutlet weak var category: UILabel?
    @IBOutlet weak var updatedDate: UILabel?
    @IBOutlet weak var version: UILabel?
    @IBOutlet weak var rating: UILabel?

    var item: DetailViewModelItem? {
        didSet {
            guard let item = item as? DetailViewModelInformationItem else {
                return
            }
            
            developer?.text = item.developer
            category?.text = item.category
            updatedDate?.text = item.updatedDate.shortDate()
            version?.text = item.version
            rating?.text = item.rating
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
