//
//  AgeCalculatorVC.swift
//  SIP Calculator
//
//  Created by Rohit Kanani on 12/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class AgeCalculatorVC: UIViewController {
	@IBOutlet weak var collectionQuick : UICollectionView!
	
	@IBOutlet weak var viewBirthDate : UIView!
	@IBOutlet weak var viewToDate : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewTwo : UIView!
	@IBOutlet weak var viewThee : UIView!
	
	
	@IBOutlet weak var lblDayBirth : UILabel!
	@IBOutlet weak var lblDayCurrent : UILabel!
	
	@IBOutlet weak var lblYear : UILabel!
	@IBOutlet weak var lblMonth : UILabel!
	@IBOutlet weak var lblDay : UILabel!
	@IBOutlet weak var lblNBYear : UILabel!
	@IBOutlet weak var lblNBMonth : UILabel!
	@IBOutlet weak var lblNBDay : UILabel!
	
	@IBOutlet weak var lblTotalYear : UILabel!
	@IBOutlet weak var lblTotalMonth : UILabel!
	@IBOutlet weak var lblTotalWeek : UILabel!
	@IBOutlet weak var lblTotalDay : UILabel!
	
	@IBOutlet weak var txtBirthdate : UITextField!
	@IBOutlet weak var txtToDate : UITextField!
	let datePicker = UIDatePicker()
	let dateToPicker = UIDatePicker()
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
		self.viewOne.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)//UIColor().hexStringToUIColor(hex: "B2B6D8")
		self.viewTwo.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)//UIColor().hexStringToUIColor(hex: "5AC8CC")
		self.viewThee.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)//UIColor().hexStringToUIColor(hex: "77B3FA")
		datePicker.datePickerMode = .date
		txtBirthdate.inputView = datePicker
		datePicker.addTarget(self, action: #selector(birthDateChanged(_:)), for: .valueChanged)
		dateToPicker.datePickerMode = .date
		txtToDate.inputView = dateToPicker
		dateToPicker.addTarget(self, action: #selector(toDateChanged), for: .valueChanged)
		txtToDate.text = Date().today
		txtBirthdate.text = Date().today
		lblDayBirth.text = Date().getDayOfWeek(Date().today)
		lblDayCurrent.text = Date().getDayOfWeek(Date().today)
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
		
	}
	
	
	@IBAction func actionCalcuate(_ sender : UIButton){
		if !txtToDate.text!.isEmpty && !txtBirthdate.text!.isEmpty{
			lblYear.text = String(Date().calculateAge(dob: txtBirthdate.text!, toDate: txtToDate.text!).year)
			lblMonth.text = String(Date().calculateAge(dob: txtBirthdate.text!, toDate: txtToDate.text!).month)
			lblDay.text = String(Date().calculateAge(dob: txtBirthdate.text!, toDate: txtToDate.text!).day)
			lblTotalDay.text = String(Date().differenceMinutes(ofComponent: .day, fromDate: txtBirthdate.text!, endDate: txtToDate.text!))
			lblTotalWeek.text = String(Date().differenceMinutes(ofComponent: .weekOfYear, fromDate: txtBirthdate.text!, endDate: txtToDate.text!))
			lblTotalMonth.text = String(Date().differenceMinutes(ofComponent: .month, fromDate: txtBirthdate.text!, endDate: txtToDate.text!))
			lblTotalYear.text = String(Date().differenceMinutes(ofComponent: .year, fromDate: txtBirthdate.text!, endDate: txtToDate.text!))
			self.checkNextBirthday()
			
			print(Date().getDayOfWeek(txtBirthdate.text!))
			
			
		}else{
			self.ShowAlertMessageGloble(title: "", message: "Please select boath date ", buttonText: "OK")
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		lblDayBirth.text = Date().getDayOfWeek(Date().today)
		lblDayCurrent.text = Date().getDayOfWeek(Date().today)
		txtToDate.text = Date().today
		txtBirthdate.text = Date().today
		lblTotalYear.text = "0"
		lblTotalMonth.text = "0"
		lblTotalWeek.text = "0"
		lblTotalDay.text = "0"
		lblYear.text = "0"
		lblDay.text = "0"
		lblMonth.text = "0"
		lblNBYear.text = "0"
		lblNBDay.text = "0"
		lblNBMonth.text = "0"
	}
	
	@objc func birthDateChanged(_ sender: UIDatePicker) {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd-MM-yyyy"
		txtBirthdate.text = formatter.string(from: sender.date)
		lblDayBirth.text = Date().getDayOfWeek(txtBirthdate.text!)
		
	}
	@objc func toDateChanged(_ sender: UIDatePicker) {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd-MM-yyyy"
		txtToDate.text = formatter.string(from: sender.date)
		lblDayCurrent.text = Date().getDayOfWeek(txtToDate.text!)
	}
	
	func checkNextBirthday(){
		let data = Date().checkNextBirthday(birthDate: txtBirthdate.text!)
		lblNBYear.text = String(data.year)
		lblNBMonth.text = String(data.month)
		lblNBDay.text = String(data.day)
		
	}
}


