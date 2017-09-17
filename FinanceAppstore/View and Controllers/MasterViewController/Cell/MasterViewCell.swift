//
//  MasterViewCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 16/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit

class MasterViewCell: UITableViewCell {
    @IBOutlet weak var ranking: UILabel!
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
