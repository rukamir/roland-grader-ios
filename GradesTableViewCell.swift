//
//  GradesTableViewCell.swift
//  Roland Grader
//
//  Created by Jimmy Roland on 4/30/16.
//  Copyright © 2016 Jimmy Roland. All rights reserved.
//

import UIKit

class GradesTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet var gradePts: UILabel!
    @IBOutlet var numOfQ: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
