//
//  QuickCell.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 21/12/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class QuickCell: UICollectionViewCell {

	@IBOutlet weak var lblTitle : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	static var nib:UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	static var identifier: String {
		return String(describing: self)
	}
}
