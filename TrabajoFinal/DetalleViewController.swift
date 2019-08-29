//
//  DetalleViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Kingfisher

class DetalleViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productStockLabel: UILabel!

    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let product = product {
            productDescriptionLabel.text = product.description
            //productPriceLabel = product.price
            //productStockLabel = product.stock
            //productTypeLabel = product.type
            if let image = product.image {
                productImage.kf.setImage(with: URL(string: image))
            }
            productTypeLabel.text = product.type

        }
    }

}
