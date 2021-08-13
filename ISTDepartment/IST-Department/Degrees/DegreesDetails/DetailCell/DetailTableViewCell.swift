//
//  DetailTableViewCell.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/12/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var descriptionLabel: UITextView!
    @IBOutlet var degreesName: UILabel!
    @IBOutlet var concentrationsLabel: UILabel!
    @IBOutlet var concentrationText: UILabel!
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var url: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
