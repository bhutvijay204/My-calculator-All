//
//  CashCalculatorVC.swift
//  SIP Calculator
//
//  Created by Rohit Kanani on 12/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit
import SQLite3

class CashCalculatorVC: UIViewController {
	@IBOutlet weak var constraintHeight: NSLayoutConstraint!
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var tableCurrency : UITableView!
	@IBOutlet weak var txtRemark : UITextField!
	@IBOutlet weak var lblTotal : UILabel!
	@IBOutlet weak var lblTotalCoins : UILabel!
	@IBOutlet weak var lblTotalCoinsValue : UILabel!
	@IBOutlet weak var lblTotalNotes : UILabel!
	@IBOutlet weak var lblTotalNotesValue : UILabel!
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
	var listCount = [CurrencyCT]()
	var total = 0
	var totalCoins = 0
	var totalCoinsValue = 0
	var totalNotes = 0
	var totalNotesValue = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setScroll()
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		self.viewOne.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		tableCurrency.register(CurrencyCountCell.nib, forCellReuseIdentifier: CurrencyCountCell.identifier)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
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
	@IBAction func actionHistory(_ sender: UIButton) {
		//			let history = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyHistoryVC") as! CurrencyHistoryVC
		//			self.navigationController?.pushViewController(history, animated: true)
	}
	
	@IBAction func actionReset(_ sender: UIButton) {
		let alertController = UIAlertController(title: "", message: "Are you sure you want to Reset?", preferredStyle: .alert)
		// Create the actions
		let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
			UIAlertAction in
			self.resetData()
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
			UIAlertAction in
			NSLog("Cancel Pressed")
		}
		// Add the actions
		alertController.addAction(okAction)
		alertController.addAction(cancelAction)
		// Present the controller
		self.present(alertController, animated: true, completion: nil)
	}
	
	@IBAction func actionSetting(_ sender: UIButton) {
		//			let setting = self.storyboard?.instantiateViewController(withIdentifier: "CurrencySettingVC") as! CurrencySettingVC
		//			self.navigationController?.pushViewController(setting, animated: true)
	}
	
	@IBAction func actionSave(_ sender: UIButton) {
		self.addTransaction()
	}
	
	func resetData(){
		self.getCurrency()
		total = 0
		totalCoins = 0
		totalCoinsValue = 0
		totalNotes = 0
		totalNotesValue = 0
		
		lblTotalCoins.text = ": \(totalCoins)"
		lblTotalCoinsValue.text = ": Rs. \(totalCoinsValue).00"
		lblTotalNotes.text = ": \(totalNotes)"
		lblTotalNotesValue.text = ": Rs. \(totalNotesValue).00"
		lblTotal.text = ": Rs. \(total).00"
	}
	
	
	func countValues(){
		total = 0
		totalCoins = 0
		totalCoinsValue = 0
		totalNotes = 0
		totalNotesValue = 0
		
		for currency in listCount{
			if currency.total!.count > 0{
				total = total + Int(currency.total!)!
				if currency.type == CType.notes.rawValue{
					totalNotes = totalNotes + Int(currency.amount!)!
					totalNotesValue = totalNotesValue  + (Int(currency.amount!)! * Int(currency.curreny!)!)
				}else{
					totalCoins = totalCoins + Int(currency.amount!)!
					totalCoinsValue = totalCoinsValue  + (Int(currency.amount!)! * Int(currency.curreny!)!)
				}
			}
		}
		lblTotalCoins.text = ": \(totalCoins)"
		lblTotalCoinsValue.text = ": Rs. \(totalCoinsValue).00"
		lblTotalNotes.text = ": \(totalNotes)"
		lblTotalNotesValue.text = ": Rs. \(totalNotesValue).00"
		lblTotal.text = ": Rs. \(total).00"
	}
}

extension CashCalculatorVC : UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listCount.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCountCell.identifier) as! CurrencyCountCell
		let list = listCount[indexPath.row]
		cell.indexPath = indexPath
		cell.txtNumber.text = list.amount
		cell.lblTotal.text = list.total
		if list.type == CType.coins.rawValue{
			cell.lblCurrency.text = "\(CType.coins.rawValue) \(list.curreny!)"
		}else{
			cell.lblCurrency.text = list.curreny
		}
		//        cell.txtNumber.text = list.amount
		//        cell.txtTotal.text = list.total
		
		cell.onUnitChnage = {(tag,value,total,index) in
			self.listCount[indexPath.row].amount = value
			self.listCount[indexPath.row].total = total
			self.countValues()
			
		}
		
		return cell
	}
	
}
	//MARK:- Database
extension CashCalculatorVC{
	func getCurrency(){
		
		var stmts: OpaquePointer?
		if sqlite3_open(fileURL.path, &stmts) != SQLITE_OK {
			//////print("error opening database")
		}
		
		let queryStringStudyClock = "SELECT currency,type FROM currency WHERE is_active=\(1);"
		//////print(queryStringStudyClock)
		listCount = [CurrencyCT]()
		
		if sqlite3_prepare(stmts, queryStringStudyClock, -1, &stmts, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(stmts)!)
			//////print("error preparing studyclock get: \(errmsg)")
		}
		while(sqlite3_step(stmts) == SQLITE_ROW){
			var count = CurrencyCT()
			count.curreny = String(cString: sqlite3_column_text(stmts, 0))
			count.type = String(cString: sqlite3_column_text(stmts, 1))
			count.amount = ""
			count.total = ""
			listCount.append(count)
		}
		constraintHeight.constant = CGFloat(Double(listCount.count * 44))
		sqlite3_finalize(stmts);
		sqlite3_close(stmts);
		tableCurrency.reloadData()
	}
	
	
	func addTransaction() {
		var stmt: OpaquePointer?
		if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
			//////print("error opening database")
		}
		if sqlite3_open(fileURL.path, &stmt) != SQLITE_OK {
			//////print("error opening database")
		}
		let queryString = "INSERT INTO trans (nt2000,nt500,nt200,nt100,nt50,nt20,nt10,nt5,nt2,nt1,co10,co5,co2,co1,total,total_coins,total_coins_value,total_notes,total_notes_value,is_deleted,remark,created_date,updated_date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
		if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(stmt)!)
			print("error preparing insert currency :- \(errmsg)")
		}
		let created_date = Date().todayTransaction
		let updated_date = Date().todayTransaction
		for i in 0..<listCount.count{
			if listCount[i].amount?.count == 0{
				listCount[i].amount = "0"
			}
		}
		
		for list in listCount{
			if list.curreny == "2000"{
				sqlite3_bind_int(stmt,1, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "500"{
				sqlite3_bind_int(stmt,2, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "200"{
				sqlite3_bind_int(stmt,3, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "100"{
				sqlite3_bind_int(stmt,4, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "50"{
				sqlite3_bind_int(stmt,5, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "20"{
				sqlite3_bind_int(stmt,6, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "10" && list.type == CType.notes.rawValue{
				sqlite3_bind_int(stmt,7, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "5" && list.type == CType.notes.rawValue{
				sqlite3_bind_int(stmt,8, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "2" && list.type == CType.notes.rawValue{
				sqlite3_bind_int(stmt,9, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "1" && list.type == CType.notes.rawValue{
				sqlite3_bind_int(stmt,10, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "10"{
				sqlite3_bind_int(stmt,11, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "5"{
				sqlite3_bind_int(stmt,12, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "2"{
				sqlite3_bind_int(stmt,13, Int32(Int(list.amount ?? "0")!))
			}else if list.curreny == "1"{
				sqlite3_bind_int(stmt,14, Int32(Int(list.amount ?? "0")!))
			}
		}
		sqlite3_bind_int(stmt,15, Int32(total))//total
		sqlite3_bind_int(stmt,16, Int32(totalCoins))//total_coins
		sqlite3_bind_int(stmt,17, Int32(totalCoinsValue))//total_coins_value
		sqlite3_bind_int(stmt,18, Int32(totalNotes))//total_notes
		sqlite3_bind_int(stmt,19, Int32(totalNotesValue))//total_notes_value
		sqlite3_bind_int(stmt,20, Int32(0))//Is Delete
		sqlite3_bind_text(stmt,21, ((txtRemark.text ?? "") as NSString).utf8String, -1, nil)
		sqlite3_bind_text(stmt,22, (created_date as NSString).utf8String, -1, nil)
		sqlite3_bind_text(stmt,23, (updated_date as NSString).utf8String, -1, nil)
		
		if sqlite3_step(stmt) != SQLITE_DONE {
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("Insert transaction : \(errmsg)")
			if errmsg == "SQL logic error"{
				
			}
		}else{
			self.ShowAlertMessageGloble(title: "", message: "Successfully store.", buttonText: "OK")
			sqlite3_finalize(stmt);
			sqlite3_close(db);
			
		}
	}
}

