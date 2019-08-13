//
//  ViewShadow.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class ViewShadow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.75
    }
}
