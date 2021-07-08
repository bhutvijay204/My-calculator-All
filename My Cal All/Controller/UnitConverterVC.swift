//
//  UnitConverterVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit


extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
}

extension String {
    func isValidDouble(maxDecimalPlaces: Int) -> Bool {

        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        let decimalSeparator = formatter.decimalSeparator ?? "."
        
        if formatter.number(from: self) != nil {
            let split = self.components(separatedBy: decimalSeparator)
            let digits = split.count == 2 ? split.last ?? "" : ""
            return digits.count <= maxDecimalPlaces
        }
        return false
    }
}

enum unit : String {
    case gram = "Gram"
    case kilogram = "Kilogram"
    case pound = "Pound"
    case ounce = "Ounce"
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
    case meter = "Meter"
    case foot = "Foot"
    case yard = "Yard"
    case kilometre = "Kilometer"
    case mile = "Mile"
    case MPS = "Meter Per Second"
    case FPM = "Feet Per Minutes"
    case KPH = "Kilmeter Per Hour"
    case MPH = "Mile Per Hour"
    case litre = "Liter"
    case mililitre = "Mililiter"
    case usgal = "usGal"
}


class UnitConverterVC: UIViewController {
	@IBOutlet weak var viewOne : UIView!
	@IBOutlet weak var viewBirthDate : UIView!
	@IBOutlet weak var viewToDate : UIView!
	@IBOutlet weak var viewClear : UIView!
	@IBOutlet weak var viewCalculate : UIView!
	@IBOutlet weak var viewSave : UIView!
	
	
	@IBOutlet weak var tableUnit : UITableView!
	@IBOutlet weak var constraintX: NSLayoutConstraint!
	
	@IBOutlet weak var lblWeight : UILabel!
	@IBOutlet weak var lblTemprature : UILabel!
	@IBOutlet weak var lblDistance : UILabel!
	@IBOutlet weak var lblSpeed : UILabel!
	@IBOutlet weak var lblVolume : UILabel!
	
	@IBOutlet weak var lblOne : UILabel!
	@IBOutlet weak var lblTwo : UILabel!
	@IBOutlet weak var lblThree : UILabel!
	@IBOutlet weak var lblFour : UILabel!
	@IBOutlet weak var lblFive : UILabel!
	
	@IBOutlet weak var selectedUnit : UILabel!
	@IBOutlet weak var txtUnit: UITextField!
	
	@IBOutlet weak var viewUnit: UIView!
	@IBOutlet weak var viewLine: UIView!
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
	let weightConverter = WeightConverter()
	let volumeConverter = VolumeConverter()
	let speedConverter = SpeedConverter()
	let distanceConverter = DistanceConverter()
	let temperatureConverter = TemperatureConverter()
	
	let listHeader = ["Weight","Temprature","Distance","Speed","Volume"]
	
	let listWeight = ["Gram","Kilogram","Pound","Ounce"]
	let listTemprature = ["Celsius","Fahranheit","Kelvin"]
	let listDistance = ["Meter","Foot","Yard","Kilometer","Mile"]
	let listSpeed = ["Meter Per Second","Feet Per Minutes","Kilmeter Per Hour","Mile Per Hour"]
	let listVolume = ["Liter","Mililiter","UsGal"]
	
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
		self.setLable()
		lblWeight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		tableUnit.register(CurrencyCell.nib, forCellReuseIdentifier: CurrencyCell.identifier)
		viewUnit.isHidden = true
		//lblWeight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
	
	@IBAction func actionSelectMenu(_ sender : UIButton){
		self.setLable()
		txtUnit.tag = sender.tag
		switch sender.tag {
			case 1:
				lblWeight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
				selectedUnit.text = "Gram"
				constraintX.constant = 0
				break
			case 2:
				lblTemprature.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
				selectedUnit.text = "Celsius"
				constraintX.constant = viewLine.frame.width
				break
			case 3:
				lblDistance.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
				selectedUnit.text = "Meter"
				constraintX.constant = viewLine.frame.width * 2
				break
			case 4:
				lblSpeed.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
				selectedUnit.text = "Meter Per Second"
				constraintX.constant = viewLine.frame.width * 3
				break
			case 5:
				lblVolume.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
				selectedUnit.text = "Liter"
				constraintX.constant = viewLine.frame.width * 4
				break
			default:
				break
		}
		self.resetFields()
	}
	
	@IBAction func actionCalculate(_ sender : UIButton){
		if txtUnit.text!.isEmpty{
			self.ShowAlertMessageGloble(title: "", message: "Please enter unit value", buttonText: "OK")
		}else{
			self.unitChanged(txtUnit)
		}
	}
	
	@IBAction func actionClear(_ sender : UIButton){
		
		self.resetFields()
	}
	
	@IBAction func actionSelectUnit(_ sender : UIButton){
		viewUnit.isHidden = false
	}
	
	func setAnswer(strOne : String,strTwo : String,strThree : String,strFour : String,strFive : String){
		self.lblOne.text = strOne
		self.lblTwo.text = strTwo
		self.lblThree.text = strThree
		self.lblFour.text = strFour
		self.lblFive.text = strFive
	}
	func resetFields() -> () {
		txtUnit.text = ""
		self.lblOne.text = "0"
		self.lblTwo.text = "0"
		self.lblThree.text = "0"
		self.lblFour.text = "0"
		self.lblFive.text = "0"
    }
	func setLable(){
		lblWeight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.60)
		lblTemprature.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.60)
		lblDistance.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.60)
		lblSpeed.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.60)
		lblVolume.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.60)
	}
}

extension UnitConverterVC  : UITableViewDelegate,UITableViewDataSource{

	func numberOfSections(in tableView: UITableView) -> Int {
		return listHeader.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
			case 0:
				return listWeight.count
			case 1:
				return listTemprature.count
			case 2:
				return listDistance.count
			case 3:
				return listSpeed.count
			case 4:
				return listVolume.count
			default:
				return 0
		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier) as! CurrencyCell
		switch indexPath.section {
			case 0:
				cell.lblEntity.text = listWeight[indexPath.row]
				break
			case 1:
				cell.lblEntity.text = listTemprature[indexPath.row]
				break
			case 2:
				cell.lblEntity.text = listDistance[indexPath.row]
				break
			case 3:
				cell.lblEntity.text = listSpeed[indexPath.row]
				break
			case 4:
				cell.lblEntity.text = listVolume[indexPath.row]
				break
			default:
				break
		}
		cell.lblCode.text = ""
		return cell
	}
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		switch indexPath.section {
			case 0:
				selectedUnit.text	= listWeight[indexPath.row]
				break
			case 1:
				selectedUnit.text = listTemprature[indexPath.row]
				break
			case 2:
				selectedUnit.text = listDistance[indexPath.row]
				break
			case 3:
				selectedUnit.text = listSpeed[indexPath.row]
				break
			case 4:
				selectedUnit.text = listVolume[indexPath.row]
				break
			default:
				break
		}
		viewUnit.isHidden = true
		self.resetFields()
		return indexPath
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 44
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
		header.backgroundColor = #colorLiteral(red: 0.8828672171, green: 0.876731813, blue: 0.8838014007, alpha: 1)
		let lbl = UILabel(frame: CGRect(x: 12, y: 0, width: tableView.frame.width, height: 44))
		lbl.text = listHeader[section]
//		lbl.textColor
		header.addSubview(lbl)
		return header
	}
}

//MARK:- Calculation of converter
extension UnitConverterVC{

	@IBAction func unitChanged(_ sender: UITextField) {
		let value = sender.text!
		if(!value.isEmpty){
			let test = Double(value)
			switch  selectedUnit.text! {
				case unit.gram.rawValue:
					let values = weightConverter.gramConverter(gram: test!)
					self.setAnswer(strOne: "\(unit.gram.rawValue):- \(value)", strTwo: "\(unit.pound.rawValue):- \(values.pound)", strThree: "\(unit.kilogram.rawValue):- \(values.kg)", strFour: "\(unit.ounce.rawValue):- \(values.ounce)", strFive: "")
					break
				case unit.kilogram.rawValue:
					let values = weightConverter.kgConverter(kg: test!)
					self.setAnswer(strOne: "\(unit.gram.rawValue):- \(values.gram)", strTwo: "\(unit.pound.rawValue):- \(values.pound)", strThree: "\(unit.kilogram.rawValue):- \(value)", strFour: "\(unit.ounce.rawValue):- \(values.ounce)", strFive: "")
					break
				case unit.pound.rawValue:
					let values = weightConverter.poundConverter(pound: test!)
					self.setAnswer(strOne: "\(unit.gram.rawValue):- \(values.gram)", strTwo: "\(unit.pound.rawValue):- \(value)", strThree: "\(unit.kilogram.rawValue):- \(values.kg)", strFour: "\(unit.ounce.rawValue):- \(values.ounce)", strFive: "")
					break
				case unit.ounce.rawValue:
					let values = weightConverter.ounceConverter(ounce: test!)
					self.setAnswer(strOne: "\(unit.gram.rawValue):- \(values.gram)", strTwo: "\(unit.pound.rawValue):- \(values.pound)", strThree: "\(unit.kilogram.rawValue):- \(values.kg)", strFour: "\(unit.ounce.rawValue):- \(value)", strFive: "")
					break
				
				case unit.celsius.rawValue:
					let values = temperatureConverter.celsiusConverter(celsius: test!)
					self.setAnswer(strOne: "\( unit.celsius.rawValue):- \(value)", strTwo: "\( unit.kelvin.rawValue):- \(values.kelvin)", strThree: "\( unit.fahrenheit.rawValue):- \(values.fahrenheit)", strFour: "", strFive: "")
					
					break
				case unit.fahrenheit.rawValue:
					let values = temperatureConverter.fahrenheitConverter(fahrenheit: test!)
					
					self.setAnswer(strOne: "\( unit.celsius.rawValue):- \(values.celsius)", strTwo: "\( unit.kelvin.rawValue):- \(values.kelvin)", strThree: "\( unit.fahrenheit.rawValue):- \(value)", strFour: "", strFive: "")
					break
				case unit.kelvin.rawValue:
					let values = temperatureConverter.kelvinConverter(kelvin: test!)
					self.setAnswer(strOne: "\( unit.celsius.rawValue):- \(values.celsius)", strTwo: "\( unit.kelvin.rawValue):- \(value)", strThree: "\( unit.fahrenheit.rawValue):- \(values.fahrenheit)", strFour: "", strFive: "")
					break
				
				case unit.meter.rawValue:
					let values = distanceConverter.metreConverter(metre: test!)
					self.setAnswer(strOne: "\( unit.meter.rawValue):- \(value)", strTwo: "\( unit.foot.rawValue):- \(values.foot)", strThree: "\( unit.yard.rawValue):- \(values.yard)", strFour: "\( unit.kilometre.rawValue):- \(values.km)", strFive: "\( unit.mile.rawValue):- \(values.mile)")
					break
				case unit.foot.rawValue:
					let values = distanceConverter.footConverter(foot: test!)
					self.setAnswer(strOne: "\( unit.meter.rawValue):- \(values.metre)", strTwo: "\( unit.foot.rawValue):- \(value)", strThree: "\( unit.yard.rawValue):- \(values.yard)", strFour: "\( unit.kilometre.rawValue):- \(values.km)", strFive: "\( unit.mile.rawValue):- \(values.mile)")
					break
				case unit.yard.rawValue:
					let values = distanceConverter.yardConverter(yard: test!)
					self.setAnswer(strOne: "\( unit.meter.rawValue):- \(values.metre)", strTwo: "\( unit.foot.rawValue):- \(values.foot)", strThree: "\( unit.yard.rawValue):- \(value)", strFour: "\( unit.kilometre.rawValue):- \(values.km)", strFive: "\( unit.mile.rawValue):- \(values.mile)")
					break
				case unit.kilometre.rawValue:
					let values = distanceConverter.kmConverter(km: test!)
					self.setAnswer(strOne: "\( unit.meter.rawValue):- \(values.metre)", strTwo: "\( unit.foot.rawValue):- \(values.foot)", strThree: "\( unit.yard.rawValue):- \(values.yard)", strFour: "\( unit.kilometre.rawValue):- \(value)", strFive: "\( unit.mile.rawValue):- \(values.mile)")
					break
				case unit.mile.rawValue:
					let values = distanceConverter.mileConverter(mile: test!)
					self.setAnswer(strOne: "\( unit.meter.rawValue):- \(values.metre)", strTwo: "\( unit.foot.rawValue):- \(values.foot)", strThree: "\( unit.yard.rawValue):- \(values.yard)", strFour: "\( unit.kilogram.rawValue):- \(values.km)", strFive: "\( unit.mile.rawValue):- \(value)")
					break
				
				case unit.MPS.rawValue:
					let values = speedConverter.metreSecConverter(metre: test!)
					self.setAnswer(strOne: "\(unit.MPS.rawValue):- \(value)", strTwo: "\(unit.FPM.rawValue):- \(values.feet)", strThree: "\(unit.KPH.rawValue):- \(values.km)", strFour: "\(unit.MPH.rawValue):- \(values.mile)", strFive: "")
					break
				case unit.FPM.rawValue:
					let values = speedConverter.feetMinConverter(feet: test!)
					self.setAnswer(strOne: "\(unit.MPS.rawValue):- \(values.metre)", strTwo: "\(unit.FPM.rawValue):- \(value)", strThree: "\(unit.KPH.rawValue):- \(values.km)", strFour: "\(unit.MPH.rawValue):- \(values.mile)", strFive: "")
					break
				case unit.KPH.rawValue:
					let values = speedConverter.kmHourConverter(km: test!)
					self.setAnswer(strOne: "\(unit.MPS.rawValue):- \(values.metre)", strTwo: "\(unit.FPM.rawValue):- \(values.feet)", strThree: "\(unit.KPH.rawValue):- \(value)", strFour: "\(unit.MPH.rawValue):- \(values.mile)", strFive: "")
					break
				case unit.MPH.rawValue:
					let values = speedConverter.mileHourConverter(mile: test!)
					self.setAnswer(strOne: "\(unit.MPS.rawValue):- \(values.metre)", strTwo: "\(unit.FPM.rawValue):- \(values.feet)", strThree: "\(unit.KPH.rawValue):- \(values.km)", strFour: "\(unit.MPH.rawValue):- \(value)", strFive: "")
					break
				
				case unit.litre.rawValue:
					let values = volumeConverter.literConverter(liter: test!)
					self.setAnswer(strOne: "\( unit.litre.rawValue):- \(value)", strTwo: "\( unit.mililitre.rawValue):- \(values.mililiter)", strThree: "\( unit.usgal.rawValue):- \(values.usGal)", strFour: "", strFive: "")
					break
				case unit.mililitre.rawValue:
					let values = volumeConverter.mililiterConverter(mililiter: test!)
					self.setAnswer(strOne: "\( unit.litre.rawValue):- \(values.liter)", strTwo: "\( unit.mililitre.rawValue):- \(value)", strThree: "\( unit.usgal.rawValue):- \(values.usGal)", strFour: "", strFive: "")
					break
				case unit.usgal.rawValue:
					let values = volumeConverter.usGalConverter(usgal: test!)
					self.setAnswer(strOne: "\( unit.litre.rawValue):- \(values.liter)", strTwo: "\( unit.mililitre.rawValue):- \(values.mililiter)", strThree: "\( unit.usgal.rawValue):- \(value)", strFour: "", strFive: "")
					break
				default:
					break
			}
		}
		
	}
	
}
extension UnitConverterVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            if txtAfterUpdate == " "{
                return false
            }
            if txtAfterUpdate.count < 7{
                let aSet = NSCharacterSet(charactersIn:"1234567890.").inverted
                let compSepByCharInSet = string.components(separatedBy: aSet)
                let numberFiltered = compSepByCharInSet.joined(separator: "")
				return string == numberFiltered
            }else{
                return false
            }
        }else{
            return true
        }
    }
}
