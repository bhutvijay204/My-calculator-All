//
//  ShoppingCell.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 22/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class ShoppingCell: UITableViewCell {

	@IBOutlet weak var txtIteam : UITextField!
	@IBOutlet weak var txtPrice : UITextField!
    
    var indexPath : IndexPath!
    var onIteamChnage : ((Int,String,IndexPath) ->())?
	var onPriceChnage : ((Int,String,IndexPath) ->())?
	var onDelete : ((IndexPath) ->())?
    
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
	@IBAction func iteamChanged(_ sender: UITextField) {
//		if sender.text == ""{
//			onIteamChnage?(sender.tag,"0",indexPath)
//		}else{
		onIteamChnage?(sender.tag,sender.text  ?? "0",indexPath)
//		}
	}
	
	@IBAction func priceChanged(_ sender: UITextField) {
//		if sender.text == ""{
//			onPriceChnage?(sender.tag,"0",indexPath)
//		}else{
			onPriceChnage?(sender.tag,sender.text ?? "0",indexPath)
//		}
	}
	
	@IBAction func actionDelete(_ sender: UIButton) {
		onDelete?(indexPath)
	}
}
