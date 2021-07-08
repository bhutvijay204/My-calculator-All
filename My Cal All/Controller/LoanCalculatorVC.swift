//
//  LoanCalculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class LoanCalculatorVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewP : UIView!
	@IBOutlet weak var viewA : UIView!
	@IBOutlet weak var viewN : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	@IBOutlet weak var txtP : UITextField!
	@IBOutlet weak var txtR : UITextField!
	@IBOutlet weak var txtN : UITextField!
	@IBOutlet weak var lblBaseAmount : UILabel!
	@IBOutlet weak var lblInterest  : UILabel!
	@IBOutlet weak var lblYear : UILabel!
	@IBOutlet weak var lblBalance : UILabel!
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
	
	
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
		//		txtP.text = "100000"
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
			self.ShowAlertMessageGloble(title: "", message: "Please enter number of month", buttonText: "OK")
		}else{
			self.compoundIntrest()
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		txtP.text = ""
		txtR.text = ""
		txtN.text = ""
		
		lblBaseAmount.text = "Base amount: \(txtP.text!)"
		lblInterest.text = "Interest Rate: \(txtR.text!)% (Yearly)"
		lblYear.text = "Calculation period: \(txtN.text!) years"
		lblBalance.text = "After \(txtN.text!) years your balance is \(0)"
	}
	
	func compoundIntrest(){
		let p = Double(txtP.text!)!//3000.0
		let r = Double(txtR.text!)!//10.0
		let y = (Int(txtN.text!)!)//1
		
		lblBaseAmount.text = "\(txtP.text!)"
		lblInterest.text = 	 "\(txtR.text!)% (Yearly)"
		lblYear.text = 		 "\(txtN.text!) Months"
		
		lblBalance.text = 	 "\(emi_calculator(pp: Float(p), rr: Float(r), tt: Float(y)))"
	}
	func emi_calculator(pp : Float,rr : Float, tt : Float) -> Float //Loan EMI
	{
		var emi : Float = Float()
		var r = rr
		var t = tt
		let p = pp
		
		r = r / (12 * 100); // one month interest
		//			t = t * 12; // one month period
		
		emi = (p * r * pow(1 + r, t)) / (pow(1 + r, t) - 1);
		print((p * r * pow(1 + r, 1)) / (pow(1 + r, 1) - 1))
		
		//		 P x R x (1+R)^N] / [(1+R)^N-1]
		
		return (emi);
	}
	
}






