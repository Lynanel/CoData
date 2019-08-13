//
//  AddArticleController.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class AddArticleController: UIViewController {

    @IBOutlet weak var imageIV: UIView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var shopTF: UITextField!
    
    
    var liste: Liste!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addArticleAction(_ sender: Any) {
    }
    
    
    @IBAction func pictureGallery(_ sender: Any) {
    }
    
    @IBAction func camera(_ sender: Any) {
    }
    
}
