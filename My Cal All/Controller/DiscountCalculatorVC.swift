//
//  DiscountCalculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class DiscountCalculatorVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewBill : UIView!
	@IBOutlet weak var viewDiscount : UIView!
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
		viewBill.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
		viewDiscount.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.inputBackgroundColor)
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
			self.ShowAlertMessageGloble(title: "", message: "Please enter discount percentage", buttonText: "OK")
		}else{
			let price = Float(txtP.text!)!
			let rate = Float(txtR.text!)!
			let tip = ((price * rate) / 100)
			lblBillAmount.text = "\(price)"
			lblTipAmount.text = "\(tip)"
			lblTotalBillAmount.text = "\(price - tip)"
			
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
extension DiscountCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
		if views.discount.rawValue != listMenu[indexPath.row].view!{
			cell.lblTitle.textColor = .white
		}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.discount.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension AgeCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
//		@IBOutlet weak var collectionQuick : UICollectionView!
//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.age.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		  return CGSize(width: 146, height: 68)
	  }
	  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if views.age.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}

    }
}
extension AnniversaryCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
//		@IBOutlet weak var collectionQuick : UICollectionView!
//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.day.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		  return CGSize(width: 146, height: 68)
	  }
	  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.day.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}

    }
}
extension CashCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.cash.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.cash.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension CurrrencyConverterVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.currency.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.currency.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}

extension DifferentDateVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.differnt.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.differnt.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}

extension IntrestCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.intrest.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.intrest.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension LoanCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.loan.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.loan.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension SIPCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.sip.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.sip.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension ShoppingCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.shopping.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.shopping.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension SplitAmountVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.split.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.split.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension TipCalculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.tip.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.tip.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension VatCaclculatorVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.vat.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.vat.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
		
	}
}
extension UnitConverterVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func setScroll(){
		//		@IBOutlet weak var collectionQuick : UICollectionView!
		//		var listMenu = [contollerView]()
		collectionQuick.register(QuickCell.nib, forCellWithReuseIdentifier: QuickCell.identifier)
		listMenu = calculatorsList()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickCell.identifier, for: indexPath as IndexPath) as! QuickCell
		cell.lblTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5977097603)
			if views.unit.rawValue != listMenu[indexPath.row].view!{
				cell.lblTitle.textColor = .white
			}
		cell.lblTitle.text = listMenu[indexPath.row].title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 146, height: 68)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if views.unit.rawValue != listMenu[indexPath.row].view!{
			let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
			self.navigationController?.pushViewController(calculat!, animated: true)
		}
	}
}
