//
//  MonArticleCell.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class MonArticleCell: UITableViewCell {

    @IBOutlet weak var articleIV: UIImageView!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var prixLbl: UILabel!
    @IBOutlet weak var nomArticle: UILabel!
    @IBOutlet weak var shopArticle: UILabel!
    
    var articles: Articles!
    
    func setup(_ articles: Articles) {
        self.articles = articles
        nomArticle.text = self.articles.nameArt
        if let prix = self.articles.shop {
            shopArticle.text = "Magasin: " + prix
        } else {
            shopArticle.text = ""
        }
        if let date = self.articles.dateArt {
            dateLBL.text = date.toString()
        }
        
        prixLbl.text = "Prix: \(self.articles.prixArt) €"
        articleIV.image = self.articles.imageArt  as? UIImage
    }
    
    @IBAction func deleteArticle(_ sender: Any){
        CoreDataHelper().deleteArticle(self.articles)
    }
    
}
