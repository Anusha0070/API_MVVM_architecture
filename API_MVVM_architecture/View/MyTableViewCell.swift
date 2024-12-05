//
//  MyTableViewCell.swift
//  API_MVVM_architecture
//
//  Created by Anusha Raju on 12/5/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var strMeal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
