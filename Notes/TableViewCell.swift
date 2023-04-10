//
//  TableViewCell.swift
//  Notes
//
//  Created by BrainX Technologies on 10/04/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var cellHeading: UILabel!
    @IBOutlet weak var cellTrailingText: UILabel!
    @IBOutlet weak var cellSubheading: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
