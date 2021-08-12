//
//  DetailMoneyTableViewCell.swift
//  Eval3-IOS
//
//  Created by Student06 on 12/08/2021.
//

import UIKit

class DetailMoneyTableViewCell: UITableViewCell {
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(table1 : DataMoney)  {
        moneyLabel.text = table1.priceUsd
        dateLabel.text = formattedDate(date: table1.date)
        
    }
    func formattedDate(date :String) -> String {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        let dateDate = dateFormatterInput.date(from: date)

        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = "dd.MM.yy"
        return dateFormatterOutput.string(from: dateDate ?? Date())
    }
}
