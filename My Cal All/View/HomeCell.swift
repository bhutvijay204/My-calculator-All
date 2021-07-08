//
//  HomeCell.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 14/12/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

	@IBOutlet weak var viewImage : UIView!
	@IBOutlet weak var viewBack : UIView!
	@IBOutlet weak var lblTitle : UILabel!
	@IBOutlet weak var imgIcon : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
    static var nib:UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	static var identifier: String {
		return String(describing: self)
	}
	
}
