//
//  SecondViewController.swift
//  AppNews
//
//  Created by Демьян Горчаков on 21.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var titleLabelFVC: UILabel!
    @IBOutlet weak var descriptionFVC: UILabel!
    @IBOutlet weak var imageFVC: UIImageView!
    @IBOutlet weak var authorFVC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func setCell(_ article: Articles) {
        titleLabelFVC.text = article.title
        descriptionFVC.text = article.description
        imageFVC.image = article.urlImage
        authorFVC.text = article.author
        }


}
