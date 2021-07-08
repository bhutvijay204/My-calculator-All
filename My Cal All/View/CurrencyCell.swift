//
//  CurrencyCell.swift
//  UnitConverter
//
//  Created by Rohit Kanani on 01/10/19.
//  Copyright © 2019 tutorial. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

	@IBOutlet weak var lblEntity : UILabel!
	@IBOutlet weak var lblCode : UILabel!
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
