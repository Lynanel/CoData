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
    @IBOutlet weak var imageView: UIImageView!
    
    var liste: Liste!
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addArticleAction(_ sender: Any) {
    }
    
    
    @IBAction func pictureGallery(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func camera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }
    }
    
}


extension AddArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let or = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageView.image = or
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
