//
//  ViewCell.swift
//  AppNews
//
//  Created by Демьян Горчаков on 21.01.2023.
//

import UIKit
import SDWebImage

class ViewCell: UICollectionViewCell {
    
    static var reuseId = "ViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var textNewsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(_ article: Articles) {
        titleLabel.text = article.title
        authorLabel.text = article.author
        textNewsLabel.text = article.description
        
        if let image = article.urlToImage {
            imageView.sd_setImage(with: URL(string: image))
        }
    }

}
