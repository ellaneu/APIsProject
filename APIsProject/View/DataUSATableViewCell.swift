//
//  DataUSATableViewCell.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/18/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import UIKit

class DataUSATableViewCell: UITableViewCell {

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateIDLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
