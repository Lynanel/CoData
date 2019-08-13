//
//  CoreDataHelper.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import CoreData

typealias ListeCompletion = (_ liste: [Liste]?) -> Void

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
    
    func getListe(completion: ListeCompletion?) {
        
        let fectRequest: NSFetchRequest<Liste> = Liste.fetchRequest()
        let sortDEscriptor = NSSortDescriptor(key: "date", ascending: true)
        fectRequest.sortDescriptors = [sortDEscriptor]
        
        do{
            let listes = try context.fetch(fectRequest)
            completion?(listes)
        } catch {
            completion?(nil)
            print(error.localizedDescription)
        }
    }
    
    func deleteListe(_ liste: Liste) {
        if let articles = liste.article?.allObjects as? [Articles]{
            for a in articles {
                context.delete(a)
            }
        }
        context.delete(liste)
        do{
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /*************Logique ENTITY Article ******************/
    func saveArticle(name: String?, shop: String?, prix: String?, image: UIImage?, liste: Liste){
        let new = Articles(context: context)
        new.dateArt = Date()
        new.nameArt = name
        new.shop = shop
        new.imageArt = image
        if let str = prix, let double = Double(str) {
            new.prixArt = double
        }
        new.liste = liste
        save()
    }
    
    func deleteArticle(_ article: Articles) {
        context.delete(article)
        do{
            try context.save()
            NotificationCenter.default.post(name: Notification.Name("delete"), object: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
}
