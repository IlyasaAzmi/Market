//
//  CategoryCollectionViewCell.swift
//  Market
//
//  Created by Ilyasa' Azmi on 13/05/20.
//  Copyright © 2020 Ilyasa' Azmi. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func generateCell(_ category: Category) {
        nameLabel.text = category.name
        categoryImageView.image = category.image
    }
}
