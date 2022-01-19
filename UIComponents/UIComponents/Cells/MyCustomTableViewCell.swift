//
//  MyCustomTableViewCell.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 8.01.2022.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populate(with data: Person) {
        self.titleLabel.text = String(format: "Hello: %@", data.name)
        self.detailLabel.text = data.lastname
    }
}
