//
//  ExpenseSectionTableViewCell.swift
//  TECHNIFUTUR-EViOS4
//
//  Created by Student05 on 09/09/2021.
//

import UIKit

class ExpenseSectionTableViewCell: UITableViewCell {
    static let cellIdentifier = "ExpenseSectionTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(expenseSection:ExpenseSection){
        nameLabel.text = expenseSection.name
    }
    
}
