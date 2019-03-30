//
//  ItemTableViewCell.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 30/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(item: Item) {
        self.title.text = item.title
        self.date.text = item.date
    }
    
}
