//
//  ProductTableViewCell.swift
//  TrabajoFinal
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    var product : Product? {
        didSet {
            if let product = product {
                descripcionLabel.text = product.description
                tipoLabel.text = product.type
            }
            if let image = product?.image {
                productImage.kf.setImage(with: URL(string: image))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 45
        productImage.clipsToBounds = true
        productImage.contentMode = .scaleAspectFill
        // Initialization code
    }

}
