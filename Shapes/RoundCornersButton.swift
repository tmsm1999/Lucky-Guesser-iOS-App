//
//  RoundCornersButton.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 04/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import UIKit

class RoundCornersButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }

}
