//
//  DemoTableViewCell.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/17.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var demoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
