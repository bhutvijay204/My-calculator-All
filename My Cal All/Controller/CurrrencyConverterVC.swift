//
//  CurrrencyConverterVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class CurrrencyConverterVC: UIViewController {
	
	@IBOutlet weak var tableCurrency : UITableView!
	@IBOutlet weak var viewCurrency : UIView!
	@IBOutlet weak var viewHeaderCurrency : UIView!
	@IBOutlet weak var lblFrom : UILabel!
	@IBOutlet weak var lblTo : UILabel!
	@IBOutlet weak var lblAnswer : UILabel!
	
	@IBOutlet weak var lblConverted : UILabel!
	@IBOutlet weak var lblTotaAnswer : UILabel!
	
	@IBOutlet weak var txtCount : UITextField!
			@IBOutlet weak var collectionQuick : UICollectionView!
			var listMenu = [contollerView]()
	var selectTab = 1
	
	var currencyList = [Currency]()
	var currencyListPrint = [Currency]()
	var converted = 0.0
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setScroll()
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		self.viewHeaderCurrency.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		tableCurrency.register(CurrencyCell.nib, forCellReuseIdentifier: CurrencyCell.identifier)
		self.getCurrency()
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
	@IBAction func actionCancel(_ sender: UIButton){
		self.view.endEditing(true)
		viewCurrency.isHidden = true
	}
	
	@IBAction func actionSelect(_ sender: UIButton){
		self.view.endEditing(true)
		viewCurrency.isHidden = false
		selectTab = 1
		if sender.tag == 2{
			selectTab = 2
		}
	}
	
	func getCurrency(){
		if let path = Bundle.main.path(forResource: "currency", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				if let parsedData = try? JSONSerialization.jsonObject(with: data) as! [String:Any] {
					let demo  = parsedData["currency"] as! [[String:Any]]
					currencyList = [Currency]()
					currencyListPrint = [Currency]()
					for cur in demo{
						var cureny = Currency()
						cureny.alphabetic_code = cur["AlphabeticCode"] as? String ?? ""
						cureny.currency = cur["currency"] as? String ?? ""
						cureny.entity = cur["entity"] as? String ?? ""
						currencyList.append(cureny)
						currencyListPrint.append(cureny)
					}
					
				}
			} catch {
			}
		}
	}
	func converCurrency(){
		if lblFrom.text != "Select Currency" && lblTo.text != "Select Currency"{
			let paramter = "\(lblFrom.text!)_\(lblTo.text!)"
			//https://free.currconv.com/api/v7/convert?q=USD_USD&compact=ultra&apiKey=a432c22ea638bf2f2b33
			// Do any additional setup after loading the view.
			self.getWebData(method: "GET", webURL: Web.web_managed_gps_clients, parameters: paramter)
			{(parsedData,error) in
				if error == 2{
					let value = parsedData[paramter] as! [String:Any]
					let va = value["val"] as! Double
					self.converted = Double(round(100*va)/100)
					
					self.lblAnswer.text = String(self.converted)
					self.lblConverted.text = String(self.converted)
					if !self.txtCount.text!.isEmpty{
						var total = self.converted * Double(self.txtCount.text!)!
						total = Double(round(100*total)/100)
						self.lblTotaAnswer.text = String(total)
					}
				}
			}
		}
	}
}

extension CurrrencyConverterVC : UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return currencyListPrint.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier) as! CurrencyCell
		cell.lblEntity.text = currencyListPrint[indexPath.row].entity
		cell.lblCode.text = currencyListPrint[indexPath.row].alphabetic_code
		return cell
	}
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		viewCurrency.isHidden = true
		if selectTab == 1{
			lblFrom.text = currencyListPrint[indexPath.row].alphabetic_code
		}else{
			lblTo.text = currencyListPrint[indexPath.row].alphabetic_code
		}
		self.converCurrency()
		return indexPath
	}
}

extension CurrrencyConverterVC : UITextFieldDelegate{
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if let text = textField.text as NSString? {
			let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
			if txtAfterUpdate == " "{
				return false
			}
			if txtAfterUpdate.count < 7{
				let aSet = NSCharacterSet(charactersIn:"1234567890").inverted
				let compSepByCharInSet = string.components(separatedBy: aSet)
				let numberFiltered = compSepByCharInSet.joined(separator: "")
				if txtAfterUpdate.count != 0{
					if self.converted != 0.0{
						var total = self.converted * Double(txtAfterUpdate)!
						total = Double(round(100*total)/100)
						self.lblTotaAnswer.text = String(total)
					}
				}else{
					self.lblTotaAnswer.text = String(self.converted)
				}
				return string == numberFiltered
			}else{
				return false
			}
		}else{
			return true
		}
	}
}
