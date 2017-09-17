//
//  DetailViewInformationCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class DetailViewInformationCell: UITableViewCell {
    @IBOutlet weak var developer: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var updatedDate: UILabel!
    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var rating: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
