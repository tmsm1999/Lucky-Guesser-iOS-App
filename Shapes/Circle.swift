//
//  Circle.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 04/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
class Circle: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
}
