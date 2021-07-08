//
//  SIPCalculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 21/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class SIPCalculatorVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewP : UIView!
	@IBOutlet weak var viewA : UIView!
	@IBOutlet weak var viewN : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	@IBOutlet weak var tableCompound : UITableView!
	@IBOutlet weak var constraintHeight: NSLayoutConstraint!
	@IBOutlet weak var txtP : UITextField!
	@IBOutlet weak var txtR : UITextField!
	@IBOutlet weak var txtN : UITextField!
	@IBOutlet weak var lblExpected : UILabel!
	@IBOutlet weak var lblInvested  : UILabel!
	@IBOutlet weak var lblWealth : UILabel!
	@IBOutlet weak var lblMonthly : UILabel!
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
	
	var listSIP = [SIP]()
	
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
	
	@IBAction func actionCalculate(_ sender : UIButton){
		if txtP.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter Pricipal amount", buttonText: "OK")
		}else if txtR.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter anual rate", buttonText: "OK")
		}else if txtN.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter number of year", buttonText: "OK")
		}else{
			self.calculateSIP(pp: txtP.text!, rr: txtR.text!, yy: txtN.text!)
			//			self.compoundIntrest()
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		txtP.text = ""
		txtR.text = ""
		txtN.text = ""
		listSIP = [SIP]()
		constraintHeight.constant = 0
		tableCompound.reloadData()
		lblExpected.text = "0"
		lblInvested.text = "0"
		lblWealth.text = "0"
		lblMonthly.text = "0"
	}
	
	//MARK:- USER Define methods
	func calculateSIP(pp : String,rr : String,yy : String){//SIP
		let p = Double(pp)//3000.0
		let r = Double(rr)//10.0
		let y = (Int(yy)!*12)//1
		var value = 00.0
		var balance = 0
		listSIP = [SIP]()
		for _ in 0..<y{
			var Interest = 0
			var sip = SIP()
			let I = ((p!+value)*r!/100)/12
			Interest = Int(I)
			let co = I - Double(Interest)
			if co>0.4{
				Interest = Interest + 1
			}
			value = value + p! + Double(Interest)
			sip.balance = String(balance)
			print("\(balance)     \(Int(p!))   \(Interest)    \(Int(value))")
			balance = Int(value)
			sip.amount = txtP.text!
			sip.interest = String(Interest)
			sip.totalBalance = String(value)
			listSIP.append(sip)
			//			}
		}
		constraintHeight.constant = CGFloat((listSIP.count + 1) * 44)
		tableCompound.reloadData()
		let totalWealth = balance - (Int(p!) * y)
		let totalInvest = balance - totalWealth
		lblExpected.text = "\(balance)"
		lblInvested.text = "\(totalInvest)"
		lblWealth.text = "\(totalWealth)"
		lblMonthly.text = txtP.text!
	}
	
}

extension SIPCalculatorVC : UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listSIP.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CompoundIntrestCell.identifier) as! CompoundIntrestCell
		cell.lblYear.text = String(indexPath.row + 1)
		cell.lblYearIntrest.text = listSIP[indexPath.row].amount
		cell.lblTotalIntrest.text = listSIP[indexPath.row].interest
		cell.lblTotalBalance.text = listSIP[indexPath.row].totalBalance
		if indexPath.row == (listSIP.count - 1){
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
		header.lblYear.text = "Month"
		header.lblYearly.text = "Investment"
		header.lblIntrest.text = "Interest"
		return header
	}
	
}
