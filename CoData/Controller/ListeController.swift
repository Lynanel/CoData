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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()          
        naleTF.delegate = self
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Article", let controller = segue.destination as? ArticleController {
            controller.liste = sender as? Liste
        }
    }

    @IBAction func addListe(_ sender: UIButton) {
        view.endEditing(true)
        CoreDataHelper().saveListe(naleTF.text)
        updateListe()
        naleTF.text = nil
    }

}

//Delegate et Datasources
extension ListeController: UITableViewDelegate, UITableViewDataSource {
    
    //Definit le nombre de lignes total à afficher
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listes.count
    }
    
    //Charge un nombre limité de données
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListeCell") as? ListeCell {
            cell.setupCell(liste: listes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    //Definit la couleur des données à afficher
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    //Permet de gérer les modifications et les suppressions de lignes
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let listeASuprimer = listes[indexPath.row]
            listes.remove(at: indexPath.row)
            CoreDataHelper().deleteListe(listeASuprimer)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Article", sender: listes[indexPath.row])
    }
}


extension ListeController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
