//
//  VatCaclculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class VatCaclculatorVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	
	@IBOutlet weak var viewBirthDate : UIView!
	@IBOutlet weak var viewToDate : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	@IBOutlet weak var imgCompound : UIImageView!
	@IBOutlet weak var imgSimple : UIImageView!
	@IBOutlet weak var lblBaseAmount : UILabel!
	@IBOutlet weak var txtP : UITextField!
	@IBOutlet weak var txtR : UITextField!
	
	@IBOutlet weak var lblNetAmount  : UILabel!
	@IBOutlet weak var lblGrossAmount : UILabel!
	@IBOutlet weak var lblVat : UILabel!
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
	
	var listCompound = [Compound]()
	var isSimpleIntrest = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setScroll()
		
		viewBirthDate.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
		viewToDate.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
		viewClear.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		viewCalculate.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		viewSave.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		self.viewOne.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		
	}
	
	@IBAction func actionBack(_ sender : UIButton){
		print(self.isModal)
		if self.isModal{
			self.dismiss(animated: true, completion: nil)
		}else{
			self.navigationController?.popViewController(animated: true)
		}
	}
	
	@IBAction func actionHome(_ sender : UIButton){
		let dashboard = self.storyboard?.instantiateViewController(withIdentifier: "DashboardNavigation") as! DashboardNavigation
		self.present(dashboard, animated: true, completion: nil)
	}
	@IBAction func actionSave(_ sender : UIButton){
		let dashboard = self.storyboard?.instantiateViewController(withIdentifier: "DashboardNavigation") as! DashboardNavigation
		self.present(dashboard, animated: true, completion: nil)
	}
	
	@IBAction func actionSelectIntrest(_ sender : UIButton){
		imgSimple.image = #imageLiteral(resourceName: "icon_radiobox")
		imgCompound.image = #imageLiteral(resourceName: "icon_radiobox")
		if sender.tag == 1{
			imgCompound.image = #imageLiteral(resourceName: "icon_check_radio")
			isSimpleIntrest = false
			lblBaseAmount.text = "Gross Amount (Including VAT)"
		}else{
			imgSimple.image = #imageLiteral(resourceName: "icon_check_radio")
			isSimpleIntrest = true
			lblBaseAmount.text = "Net Amount (Excluding VAT)"
		}
		self.actionCalculate(sender)
		
	}
	@IBAction func actionCalculate(_ sender : UIButton){
		if txtP.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter Pricipal amount", buttonText: "OK")
		}else if txtR.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter anual rate", buttonText: "OK")
		}else{
			self.vatCalculat()
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		txtP.text = ""
		txtR.text = ""
		lblNetAmount.text = "0"
		lblVat.text = "0"
		lblGrossAmount.text = "0"
	}
	
	func vatCalculat(){
		let price = Float(txtP.text!)!
		let rate = Float(txtR.text!)!
		let tip = ((price * rate) / 100)
		lblNetAmount.text = "\(price)"
		lblVat.text = "\(tip)"
		lblGrossAmount.text = "\(price + tip)"
		
	}
	
}

	
