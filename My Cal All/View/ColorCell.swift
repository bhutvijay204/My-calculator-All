//
//  ColorCell.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 17/12/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
	@IBOutlet weak var viewBack : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
