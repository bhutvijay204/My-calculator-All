//
//  TipCalculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class TipCalculatorVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewBirthDate : UIView!
	@IBOutlet weak var viewToDate : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	@IBOutlet weak var txtP : UITextField!
	@IBOutlet weak var txtR : UITextField!
	
	@IBOutlet weak var lblBillAmount : UILabel!
	@IBOutlet weak var lblTipAmount : UILabel!
	@IBOutlet weak var lblTotalBillAmount : UILabel!
	
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
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
		//		txtP.text = "520"
		//		txtR.text = "5"
		// Do any additional setup after loading the view.
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
	@IBAction func actionCalculate(_ sender : UIButton){
		if txtP.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter Pricipal amount", buttonText: "OK")
		}else if txtR.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter tip percentage", buttonText: "OK")
		}else{
			let price = Float(txtP.text!)!
			let rate = Float(txtR.text!)!
			let tip = ((price * rate) / 100)
			lblBillAmount.text = "\(price)"
			lblTipAmount.text = "\(tip)"
			lblTotalBillAmount.text = "\(price + tip)"
			
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		txtP.text = ""
		txtR.text = ""
		lblBillAmount.text = "0"
		lblTipAmount.text = "0"
		lblTotalBillAmount.text = "0"
	}
	
}
