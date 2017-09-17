//
//  DetailViewDescriptionCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class DetailViewDescriptionCell: UITableViewCell {
    @IBOutlet weak var appDescription: UILabel?

    var item: DetailViewModelItem? {
        didSet {
            guard let item = item as? DetailViewModelDescriptionItem else {
                return
            }
            
            appDescription?.text = item.appDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static var identifier: String {
        return String(describing: self)
    }
}
