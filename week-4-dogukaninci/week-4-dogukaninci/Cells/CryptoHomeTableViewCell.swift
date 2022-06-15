//
//  CryptoHomeTableViewCell.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 14.06.2022.
//

import UIKit

class CryptoHomeTableViewCell: UITableViewCell {

    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var cryptoSymbol: UILabel!
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var cryptoNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
