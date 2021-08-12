//
//  itemViewController.swift
//  Eval3-IOS
//
//  Created by Student06 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage
class itemViewController: UIViewController {
 
    
    @IBOutlet weak var tableView: UITableView!
    var table = [Coins]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
       
    }
    
    func addData() {
        AF.request("https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR").response{ data in
            switch data.result{
            case .success(let data):
                
                    if let getData = data{
                           
                                let decoder = JSONDecoder()
                                
                        let crypto =   try! decoder.decode(ImageApiCrypto.self, from: getData)
                        self.table = crypto.coins
                        self.tableView.reloadData()
                    }
            case .failure(let error):
                    print(error)
            }
            
        }
    }


}
extension itemViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table1 = table[indexPath.row]

        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        
        tableViewCell.setupCell(table1: table1)

        return tableViewCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
