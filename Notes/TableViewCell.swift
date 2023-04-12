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
    @IBOutlet weak var deleteButton: UIButton!
    weak var tableView: UITableView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func deleteNote(_ sender: UIButton) {
        guard let tableView = self.superview as? UITableView else {
                   return
               }
        
        guard let button = sender as? UIButton,
                 let cell = button.superview?.superview as? TableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
               return
           }

        notesList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        cell.contentView.backgroundColor = UIColor(red: 68/255, green: 60/255, blue: 104/255, alpha: 1.0)
        cell.deleteButton.isHidden = true
        cell.cellTrailingText.isHidden = false
    }
    
    
}
