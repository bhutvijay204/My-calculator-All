//
//  CompoundIntrestHeader.swift
//  SIP Calculator
//
//  Created by Rohit Kanani on 15/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class CompoundIntrestHeader: UITableViewHeaderFooterView {

	@IBOutlet weak var lblYearly : UILabel!
	@IBOutlet weak var lblYear : UILabel!
	@IBOutlet weak var lblIntrest : UILabel!
	
	override func awakeFromNib() {
		   super.awakeFromNib()
		   // Initialization code
	   }
	
	static var nib:UINib {
		   return UINib(nibName: identifier, bundle: nil)
	   }
	   
	   static var identifier: String {
		   return String(describing: self)
	   }
}
