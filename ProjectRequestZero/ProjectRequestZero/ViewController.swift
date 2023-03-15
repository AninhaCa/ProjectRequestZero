//
//  ViewController.swift
//  ProjectRequestZero
//
//  Created by Ana Paula Silva de Sousa on 14/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        myTableView.dataSource = self
        requestPizza()
    }

    func requestPizza() {
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza", method: .get).response { response in
            debugPrint(response)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellXIB", for: indexPath) as? MyCustomCellXIB {
            
             return cell
        }
        
        return UITableViewCell()
    }
}
