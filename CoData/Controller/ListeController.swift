//
//  ViewController.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import CoreData

class ListeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var holderView: ViewShadow!
    @IBOutlet weak var naleTF: UITextField!
    
    var listes:[Liste] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateListe()
    }
    
    func updateListe(){
        CoreDataHelper().getListe{ (listes) in
            if listes != nil {
                DispatchQueue.main.async {
                    self.listes = listes!
                    self.tableView.reloadData()
                }
            }
        }
    }

    @IBAction func addListe(_ sender: UIButton) {
        CoreDataHelper().saveListe(naleTF.text)
        updateListe()
    }

}

