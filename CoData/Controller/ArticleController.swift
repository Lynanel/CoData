//
//  ArticleController.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class ArticleController: UIViewController {

    var liste: Liste!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add", let controller = segue.destination as? AddArticleController {
            controller.liste = liste
        }
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "Add", sender: nil)
    }
    
}
