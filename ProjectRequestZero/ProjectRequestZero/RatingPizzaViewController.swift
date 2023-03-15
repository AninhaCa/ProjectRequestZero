//
//  RatingPizzaViewController.swift
//  ProjectRequestZero
//
//  Created by Ana Paula Silva de Sousa on 15/03/23.
//

import UIKit
import SDWebImage

class RatingPizzaViewController: UIViewController {

    @IBOutlet var labelRating: UILabel!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var imageRating: UIImageView!
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonFollow: UIButton!
    
    var pizzaRating = PizzaElement(id: "", name: "", imageURL: "", rating: 0, priceP: 0, priceM: 0, priceG: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlImage = URL(string: pizzaRating.imageURL ?? "")
        imageRating.sd_setImage(with: urlImage)
        labelName.text = "AVALIAÇÃO"
        labelRating.text = "Para Nossos Clientes, a pizza \(pizzaRating.name ?? "") esta na posição - \(pizzaRating.rating ?? 0)/5 - de aprovaçao"
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func blackPlay(_ sender: Any) {
        
    }
}
