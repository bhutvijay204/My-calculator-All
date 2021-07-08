//
//  CompoundIntrestCell.swift
//  SIP Calculator
//
//  Created by Rohit Kanani on 15/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class CompoundIntrestCell: UITableViewCell {
	@IBOutlet weak var lblYear : UILabel!
	@IBOutlet weak var lblYearIntrest : UILabel!
	@IBOutlet weak var lblTotalIntrest : UILabel!
	@IBOutlet weak var lblTotalBalance : UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static var nib:UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	static var identifier: String {
		return String(describing: self)
	}
}
