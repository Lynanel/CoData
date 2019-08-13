//
//  CoreDataHelper.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import CoreData
class CoreDataHelper {
    
    //Récupérer base CoreData
    private let appDel = UIApplication.shared.delegate as! AppDelegate
    
    //Récupérer le contexte
    var context: NSManagedObjectContext {
        return appDel.persistentContainer.viewContext
    }
    
    
    //Sauvegarder dans CoreDate
    func save() {
        appDel.saveContext()
    }
    
    //****** Logique entity Liste *****///
    func saveListe(_ string: String?) {
        guard let texte = string, texte != "" else { return }
        let nouvelleListe = Liste(context: context)
        nouvelleListe.date = Date()
        nouvelleListe.name = texte
        
        //Enregistrement des données de façon persitentes
        save()
    }
    
}
