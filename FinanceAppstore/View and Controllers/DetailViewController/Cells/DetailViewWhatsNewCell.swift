//
//  DetailViewWhatsNewCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class DetailViewWhatsNewCell: UITableViewCell {
    @IBOutlet weak var releaseDate: UILabel?
    @IBOutlet weak var releaseNotes: UILabel?

    var item: DetailViewModelItem? {
        didSet {
            guard let item = item as? DetailViewModelReleaseItem else {
                return
            }
            
            releaseDate?.text = item.releaseDate.shortDate()
            releaseNotes?.text = item.releaseNote
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static var identifier: String {
        return String(describing: self)
    }
}
