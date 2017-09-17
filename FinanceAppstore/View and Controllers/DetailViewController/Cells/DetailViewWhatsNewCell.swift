//
//  DetailViewWhatsNewCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class DetailViewWhatsNewCell: UITableViewCell {
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var releaseNotes: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
