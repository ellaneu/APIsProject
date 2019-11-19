//
//  NobelPrizeTableViewCell.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/19/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import UIKit

class NobelPrizeTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
