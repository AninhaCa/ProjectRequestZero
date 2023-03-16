//
//  TwoViewController.swift
//  ProjectRequestZero
//
//  Created by Ana Paula Silva de Sousa on 15/03/23.
//

import UIKit
import SDWebImage

class PricePizzaViewController: UIViewController {
    
    @IBOutlet var imagePrice: UIImageView!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelPriceP: UILabel!
    @IBOutlet var labelPriceM: UILabel!
    @IBOutlet var labelPriceG: UILabel!
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonFollow: UIButton!
    
    var pizzaPrice: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = pizzaPrice?.name ?? ""
        labelPriceP.text = "PEQUENA - R$\(pizzaPrice?.priceP ?? 0)"
        labelPriceM.text = "MÉDIA - R$\(pizzaPrice?.priceM ?? 0)"
        labelPriceG.text = "GRANDE - R$\(pizzaPrice?.priceG ?? 0)"
        let urlImage = URL(string: pizzaPrice?.imageURL ?? "")
        imagePrice.sd_setImage(with: urlImage)
    }
    
    
    @IBAction func back(_ sender: Any) {
        buttonBack.backgroundColor = .red
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func follow(_ sender: Any) {
        if let rating = self.storyboard?.instantiateViewController(identifier: "rating") as? RatingPizzaViewController {
            rating.pizzaRating = pizzaPrice
            buttonFollow.backgroundColor = .red
            self.navigationController?.pushViewController(rating, animated: true)
        }
    }
}
