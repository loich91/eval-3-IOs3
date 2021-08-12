//
//  ImageTableViewCell.swift
//  Eval3-IOS
//
//  Created by Student06 on 12/08/2021.
//

import UIKit
import AlamofireImage

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageCrypto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(table1 :Coins) {
        let url = URL(string: table1.icon)
        imageCrypto.af.setImage(withURL: url!)
        nameLabel.text = table1.name

    }
}
