//
//  TableViewCell.swift
//  Eval3-IOS
//
//  Created by Student06 on 12/08/2021.
//

import UIKit
import SafariServices

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelRank: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var btnInternetDesign: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        design()

    }
    func design()  {
        btnInternetDesign.layer.borderWidth = 1
        btnInternetDesign.layer.cornerRadius = 10
        labelRank.backgroundColor = .yellow 
        labelRank.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(table1 :DataCrypto) {
        labelRank.text = table1.rank
        priceLabel.text = formattedPrice(calc: table1.priceUsd)
        if (formattedPrice(calc: table1.changePercent24Hr).contains("-")){
            evolutionLabel.textColor = .red
            evolutionLabel.text = formattedPrice(calc: table1.changePercent24Hr)
        }
        else{
            evolutionLabel.textColor = .green
            evolutionLabel.text = "+" + formattedPrice(calc: table1.changePercent24Hr)
        }
        
    }

    func formattedPrice(calc:String) -> String {
        if let double = Double(calc) {
             let doubleValue: String = String(format: "%2.2f", double)
             return "\(doubleValue)$"
         }
         return "- $"
     }
    
    @IBAction func btnActionInternet(_ sender: Any) {
        if let url = URL(string: "https://www.blockchain.com") {
        UIApplication.shared.open(url)
            
        }
    }
    
}
