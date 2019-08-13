//
//  ListeCell.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class ListeCell: UITableViewCell {

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var liste: Liste!
    
    func setupCell(liste: Liste) {
        self.liste = liste
        nameLBL.text = self.liste.name
        if self.liste.date != nil {
            dateLbl.text = "Créer le " + self.liste.date!.toString()
        } else {
            dateLbl.text = "Aucune date disponible !!!"
        }
    }
    
}
