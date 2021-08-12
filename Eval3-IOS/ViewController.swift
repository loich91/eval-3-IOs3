//
//  ViewController.swift
//  Eval3-IOS
//
//  Created by Student06 on 12/08/2021.
//

import UIKit
import Alamofire
class ViewController: UIViewController , UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var table = [DataCrypto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegate()
        addData()
        
    
    }
    func addDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    func addData() {
        AF.request("https://api.coincap.io/v2/assets").response{ data in
            switch data.result{
            case .success(let data):
                
                    if let getData = data{
                           
                                let decoder = JSONDecoder()
                                
                        let crypto =   try! decoder.decode(Crypto.self, from: getData)
                        self.table = crypto.data
                        self.tableView.reloadData()
                    }
            case .failure(let error):
                    print(error)
            }
            
        }
    }

}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table1 = table[indexPath.row]

        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        tableViewCell.setupCell(table1: table1)
        tableViewCell.layer.borderWidth = 1
        tableViewCell.layer.cornerRadius = 20

        
        tableViewCell.clipsToBounds = true

        return tableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailCryptoViewController = storyboard?.instantiateViewController(identifier: "DetailCryptoViewController") as! DetailCryptoViewController
            DetailCryptoViewController.data = table[indexPath.row]
                navigationController?.pushViewController(DetailCryptoViewController, animated: true)
    }
    
}
