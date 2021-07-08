//
//  CurrencyCountCell.swift
//  UnitConverter
//
//  Created by Rohit on 25/09/19.
//  Copyright © 2019 tutorial. All rights reserved.
//

import UIKit

class CurrencyCountCell: UITableViewCell {

    @IBOutlet weak var viewAdd : UIView!
    
    @IBOutlet weak var lblCurrency : UILabel!
    @IBOutlet weak var txtNumber : UITextField!
    @IBOutlet weak var lblTotal : UILabel!
    var indexPath : IndexPath!
    var onUnitChnage : ((Int,String,String,IndexPath) ->())?
    var onAdd : (() ->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    @IBAction func unitChanged(_ sender: UITextField) {
        if sender.text == ""{
             self.lblTotal.text = ""
            onUnitChnage?(sender.tag,"","",indexPath)
        }else{
            if self.lblCurrency.text! == "Coins 10"{
                let total = 10 * Int(txtNumber.text!)!
                self.lblTotal.text = String(total)
            }else if self.lblCurrency.text! == "Coins 5"{
                let total = 5 * Int(txtNumber.text!)!
                self.lblTotal.text = String(total)
            }else if self.lblCurrency.text! == "Coins 2"{
                let total = 2 * Int(txtNumber.text!)!
                self.lblTotal.text = String(total)
            }else if self.lblCurrency.text! == "Coins 1"{
                self.lblTotal.text = txtNumber.text!
            }else{
                let total = Int(self.lblCurrency.text!)! * Int(txtNumber.text!)!
                self.lblTotal.text = String(total)
            }
            onUnitChnage?(sender.tag,sender.text!,self.lblTotal.text!,indexPath)
        }
    }
    
}

extension CurrencyCountCell : UITextFieldDelegate{
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
                return string == numberFiltered
            }else{
                return false
            }
        }else{
            return true
        }
    }
}
