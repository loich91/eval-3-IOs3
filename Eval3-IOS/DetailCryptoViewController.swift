//
//  DetailCryptoViewController.swift
//  Eval3-IOS
//
//  Created by Student06 on 12/08/2021.
//

import UIKit
import Alamofire

class DetailCryptoViewController: UIViewController {
 
    @IBOutlet weak var moneylabel: UILabel!
    
    var data:DataCrypto!
    var id:String = ""
    
    
    var table = [DataMoney]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        tableView.delegate = self
        tableView.dataSource = self
        moneylabel.text = data.name
        tableView.register(UINib(nibName: "DetailMoneyTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailMoneyTableViewCell")
 
    }
    func addData() {
        self.id = data.id

        AF.request("https://api.coincap.io/v2/assets/\(id)/history?interval=d1").response{ data in
            switch data.result{
            case .success(let data):
                
                    if let getData = data{
                           
                                let decoder = JSONDecoder()
                                
                        let crypto =   try! decoder.decode(ConvertDataMoney.self, from: getData)
                        self.table = crypto.data
                        self.tableView.reloadData()
                    }
            case .failure(let error):
                    print(error)
            }
            
        }
    }
    


}
extension DetailCryptoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table1 = table[indexPath.row]

        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailMoneyTableViewCell", for: indexPath) as! DetailMoneyTableViewCell
        
        tableViewCell.setupCell(table1: table1)

        return tableViewCell
    }
}
