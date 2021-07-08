//
//  IntrestCalculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class IntrestCalculatorVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewP : UIView!
	@IBOutlet weak var viewA : UIView!
	@IBOutlet weak var viewN : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	@IBOutlet weak var tableCompound : UITableView!
	@IBOutlet weak var constraintHeight: NSLayoutConstraint!
	@IBOutlet weak var imgCompound : UIImageView!
	@IBOutlet weak var imgSimple : UIImageView!
	@IBOutlet weak var txtP : UITextField!
	@IBOutlet weak var txtR : UITextField!
	@IBOutlet weak var txtN : UITextField!
	@IBOutlet weak var lblBaseAmount : UILabel!
	@IBOutlet weak var lblInterest  : UILabel!
	@IBOutlet weak var lblYear : UILabel!
	@IBOutlet weak var lblBalance : UILabel!
	
			@IBOutlet weak var collectionQuick : UICollectionView!
			var listMenu = [contollerView]()
	var listCompound = [Compound]()
	var isSimpleIntrest = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setScroll()
		viewP.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
		viewA.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
		viewN.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
		viewClear.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		viewCalculate.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		viewSave.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		self.viewOne.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		tableCompound.register(CompoundIntrestCell.nib, forCellReuseIdentifier: CompoundIntrestCell.identifier)
		tableCompound.register(CompoundIntrestHeader.nib, forHeaderFooterViewReuseIdentifier: CompoundIntrestHeader.identifier)
		//		txtP.text = "10000"
		//		txtR.text = "10"
		//		txtN.text = "5"
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
		}else{
			imgSimple.image = #imageLiteral(resourceName: "icon_check_radio")
			isSimpleIntrest = true
			
		}
		self.actionCalculate(sender)
		
	}
	@IBAction func actionCalculate(_ sender : UIButton){
		if txtP.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter Pricipal amount", buttonText: "OK")
		}else if txtR.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter anual rate", buttonText: "OK")
		}else if txtN.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter number of year", buttonText: "OK")
		}else{
			if isSimpleIntrest{
				self.simpleIntrest()
			}else{
				self.compoundIntrest()
			}
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		txtP.text = ""
		txtR.text = ""
		txtN.text = ""
		listCompound = [Compound]()
		constraintHeight.constant = 0
		tableCompound.reloadData()
		lblBaseAmount.text = "Base amount: \(txtP.text!)"
		lblInterest.text = "Interest Rate: \(txtR.text!)% (Yearly)"
		lblYear.text = "Calculation period: \(txtN.text!) years"
		lblBalance.text = "After \(txtN.text!) years your balance is \(0)"
	}
	
	func compoundIntrest(){
		var totalIntrest = 0.0
		let p = Double(txtP.text!)!//3000.0
		let r = Double(txtR.text!)!//10.0
		let y = (Int(txtN.text!)!)//1
		var CI = p
		listCompound = [Compound]()
		for _ in 0..<y{
			var com = Compound()
			let yearIntrest = CI
			com.yearInterest = String(format: "%.2f",CI)
			CI = CI * (pow((1 + r / 100), 1));
			totalIntrest = totalIntrest + (CI - yearIntrest)
			com.totalInterest = String(format: "%.2f",totalIntrest)
			com.totalBalance = String(format: "%.2f",CI)
			listCompound.append(com)
		}
		constraintHeight.constant = CGFloat((listCompound.count + 1) * 44)
		tableCompound.reloadData()
		
		lblBaseAmount.text = "Base amount: \(txtP.text!)"
		lblInterest.text = "Interest Rate: \(txtR.text!)% (Yearly)"
		lblYear.text = "Calculation period: \(txtN.text!) years"
		lblBalance.text = "After \(txtN.text!) years your balance is \(listCompound[y-1].totalBalance!)"
	}
	func simpleIntrest(){
		let p = Double(txtP.text!)!//3000.0
		let r = Double(txtR.text!)!//10.0
		let y = (Int(txtN.text!)!)//1
		var CI = p
		listCompound = [Compound]()
		
		CI = CI * (1 + (r / 100) * Double(y));
		print(CI)
		let totalIntrest = CI - p
		let yearlyIntrest = totalIntrest /  Double(y)
		
		for i in 0..<y{
			var com = Compound()
			com.totalInterest = String(format: "%.2f",(yearlyIntrest * Double(i + 1)))
			com.totalBalance =  String(format: "%.2f",p + (yearlyIntrest * Double(i + 1)))
			com.yearInterest =  String(format: "%.2f",p)
			listCompound.append(com)
		}
		//			var com = Compound()
		//			let yearIntrest = CI
		//			com.yearInterest = String(format: "%.2f",CI)
		//			CI = CI * (pow((1 + r / 100), 1));
		//			totalIntrest = totalIntrest + (CI - yearIntrest)
		//			com.totalInterest = String(format: "%.2f",totalIntrest)
		//			com.totalBalance = String(format: "%.2f",CI)
		//			listCompound.append(com)
		//		}
		constraintHeight.constant = CGFloat((y + 1) * 44)
		tableCompound.reloadData()
		
		lblBaseAmount.text = "Base amount: \(txtP.text!)"
		lblInterest.text = "Interest Rate: \(txtR.text!)% (Yearly)"
		lblYear.text = "Calculation period: \(txtN.text!) years"
		lblBalance.text = "After \(txtN.text!) years your balance is \(CI)"
	}
}

	extension IntrestCalculatorVC : UITableViewDelegate,UITableViewDataSource{
		func numberOfSections(in tableView: UITableView) -> Int {
			return 1
		}
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return listCompound.count
		}
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: CompoundIntrestCell.identifier) as! CompoundIntrestCell
			cell.lblYear.text = String(indexPath.row + 1)
			cell.lblYearIntrest.text = listCompound[indexPath.row].yearInterest
			cell.lblTotalIntrest.text = listCompound[indexPath.row].totalInterest
			cell.lblTotalBalance.text = listCompound[indexPath.row].totalBalance
			if indexPath.row == (listCompound.count - 1){
				cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0.5)
			}else{
				cell.backgroundColor = .clear
			}
			return cell
		}
		func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
			return 44
		}
		func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
			let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CompoundIntrestHeader.identifier) as! CompoundIntrestHeader
			header.lblYearly.text = "Year Interest"
			if isSimpleIntrest{
			header.lblYearly.text = "   Pricipal"
			}
			
			return header
		}
		
	}
