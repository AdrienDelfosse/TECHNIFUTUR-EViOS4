//
//  ExpenseTableViewCell.swift
//  TECHNIFUTUR-EViOS4
//
//  Created by Student05 on 09/09/2021.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {
    @IBOutlet weak var valueLabel: UILabel!
    static let cellIdentifier = "ExpenseTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(expense : Expense) {
        nameLabel.text = expense.name
        valueLabel.text = "\(expense.value) €"
    }
    
}
