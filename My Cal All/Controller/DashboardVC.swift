//
//  DashboardVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 20/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

enum views : String{
	case age = "AgeCalculatorVC"
	case cash = "CashCalculatorVC"
	case currency = "CurrrencyConverterVC"
	case day = "AnniversaryCalculatorVC"
	case differnt = "DifferentDateVC"
	case discount = "DiscountCalculatorVC"
	case intrest = "IntrestCalculatorVC"
	case loan = "LoanCalculatorVC"
	case shopping = "ShoppingCalculatorVC"
	case sip = "SIPCalculatorVC"
	case split = "SplitAmountVC"
	case tip = "TipCalculatorVC"
	case unit = "UnitConverterVC"
	case vat = "VatCaclculatorVC"
}

class DashboardVC: UIViewController {
	@IBOutlet weak var tableMain : UITableView!
	var listMenu = [contollerView]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		self.setData()
		tableMain.register(DashboardCell.nib, forCellReuseIdentifier: DashboardCell.identifier)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		tableMain.reloadData()
	}
	
	@IBAction func actionSetting(_ sender : UIButton){
		let setting = self.storyboard?.instantiateViewController(withIdentifier:"SettingVC")
		self.navigationController?.pushViewController(setting!, animated: true)
	}
}

extension DashboardVC : UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listMenu.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: DashboardCell.identifier) as! DashboardCell
//		cell.viewImage.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		cell.viewBack.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.buttonBackgroundColor)
		cell.lblTitle.text = listMenu[indexPath.row].title
		cell.imgIcon.image = listMenu[indexPath.row].image
		cell.imgIcon.tintColor = .white
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let calculat = self.storyboard?.instantiateViewController(withIdentifier: listMenu[indexPath.row].view!)
//		self.present(calculat!, animated: true, completion: nil)
		self.navigationController?.pushViewController(calculat!, animated: true)
	}
}

extension DashboardVC{
	func setData(){
		var vies = contollerView()
		vies.title = "Age Calculator"
		vies.image = #imageLiteral(resourceName: "icon_age")
		vies.view = views.age.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Cash Calculator"
		vies.image = #imageLiteral(resourceName: "icon_cash")
		vies.view = views.cash.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Currency Calculator"
		vies.image = #imageLiteral(resourceName: "icon_currency")
		vies.view = views.currency.rawValue
//		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Day Calculator"
		vies.image = #imageLiteral(resourceName: "icon_day")
		vies.view = views.day.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Different Date Calculator"
		vies.image = #imageLiteral(resourceName: "icon_different_date")
		vies.view = views.differnt.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Discount Calculator"
		vies.image = #imageLiteral(resourceName: "icon_discount")
		vies.view = views.discount.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Intrest Calculator"
		vies.image = #imageLiteral(resourceName: "icon_intrest")
		vies.view = views.intrest.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Loan Calculator"
		vies.image = #imageLiteral(resourceName: "icon_loan")
		vies.view = views.loan.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Shopping Calculator"
		vies.image = #imageLiteral(resourceName: "icon_shopping")
		vies.view = views.shopping.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "SIP Calculator"
		vies.image = #imageLiteral(resourceName: "icon_sip")
		vies.view = views.sip.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Split Calculator"
		vies.image = #imageLiteral(resourceName: "icon_split")
		vies.view = views.split.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Tip Calculator"
		vies.image = #imageLiteral(resourceName: "icon_tip")
		vies.view = views.tip.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Unit converter"
		vies.image = #imageLiteral(resourceName: "icon_unit")
		vies.view = views.unit.rawValue
		listMenu.append(vies)
		vies = contollerView()
		vies.title = "Vat Calculator"
		vies.image = #imageLiteral(resourceName: "icon_vat")
		vies.view = views.vat.rawValue
		listMenu.append(vies)
	}
}

func calculatorsList() -> [contollerView]{
	var listMenu = [contollerView]()
	var vies = contollerView()
	vies.title = "Age"
	vies.image = #imageLiteral(resourceName: "icon_age")
	vies.view = views.age.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Cash"
	vies.image = #imageLiteral(resourceName: "icon_cash")
	vies.view = views.cash.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Currency"
	vies.image = #imageLiteral(resourceName: "icon_currency")
	vies.view = views.currency.rawValue
//	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Day"
	vies.image = #imageLiteral(resourceName: "icon_day")
	vies.view = views.day.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Date"
	vies.image = #imageLiteral(resourceName: "icon_different_date")
	vies.view = views.differnt.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Discount"
	vies.image = #imageLiteral(resourceName: "icon_discount")
	vies.view = views.discount.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Intrest"
	vies.image = #imageLiteral(resourceName: "icon_intrest")
	vies.view = views.intrest.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Loan"
	vies.image = #imageLiteral(resourceName: "icon_loan")
	vies.view = views.loan.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Shopping"
	vies.image = #imageLiteral(resourceName: "icon_shopping")
	vies.view = views.shopping.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "SIP"
	vies.image = #imageLiteral(resourceName: "icon_sip")
	vies.view = views.sip.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Split"
	vies.image = #imageLiteral(resourceName: "icon_split")
	vies.view = views.split.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Tip"
	vies.image = #imageLiteral(resourceName: "icon_tip")
	vies.view = views.tip.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Unit"
	vies.image = #imageLiteral(resourceName: "icon_unit")
	vies.view = views.unit.rawValue
	listMenu.append(vies)
	vies = contollerView()
	vies.title = "Vat"
	vies.image = #imageLiteral(resourceName: "icon_vat")
	vies.view = views.vat.rawValue
	listMenu.append(vies)
	return listMenu
}

