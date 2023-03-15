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
    
    var arreyPizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "MyCustomCellXIB", bundle: nil), forCellReuseIdentifier: "cellXIB")
        requestPizza()
    }
    
    func requestPizza() {
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza", method: .get).response { response in
            let pizza = try? JSONDecoder().decode(Pizza.self, from: response.data ?? Data())
            self.arreyPizza = pizza
            self.myTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arreyPizza?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellXIB", for: indexPath) as? MyCustomCellXIB {
            cell.setupXIB(pizzaElement: self.arreyPizza?[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screenPrice = self.storyboard?.instantiateViewController(identifier: "screen") as? PricePizzaViewController {
            
            screenPrice.pizzaPrice = arreyPizza![indexPath.row]
            
            self.navigationController?.pushViewController(screenPrice, animated: true)
        }
    }
}
