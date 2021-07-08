//
//  ShoppingCalculatorVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 19/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class ShoppingCalculatorVC: UIViewController {

	@IBOutlet weak var tableShopping : UITableView!
	@IBOutlet weak var constraintHeight: NSLayoutConstraint!
	@IBOutlet weak var lblSum : UILabel!
	@IBOutlet weak var imgIteam: UIImageView!
	@IBOutlet weak var collectionQuick : UICollectionView!
	var listMenu = [contollerView]()
	var listShopping  = [Shopping]()
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setScroll()
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
		imgIteam.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		tableShopping.register(ShoppingCell.nib, forCellReuseIdentifier: ShoppingCell.identifier)
    }
	@IBAction func actionAddNew(_ sender : UIButton){
		listShopping.append(Shopping(iteam: "", price: ""))
		constraintHeight.constant = CGFloat(listShopping.count * 44)
		tableShopping.reloadData()
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
	
	func calculate(){
		var total = 0
		for iteam in listShopping{
			if iteam.price! != ""{
				total = total + Int(iteam.price!)!
			}
		}
		
		lblSum.text = "\(total)"
		
	}
	
}

extension ShoppingCalculatorVC  : UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listShopping.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCell.identifier) as! ShoppingCell
		cell.indexPath = indexPath
		cell.txtIteam.text = listShopping[indexPath.row].iteam
		cell.txtPrice.text = listShopping[indexPath.row].price
		cell.onDelete = { (index) in
			self.listShopping.remove(at: index.row)
			self.constraintHeight.constant = CGFloat(self.listShopping.count * 44)
			self.tableShopping.reloadData()
			self.calculate()
		}
		cell.onIteamChnage = {(tag,value,index) in
			self.listShopping[index.row].iteam = value
		}
		cell.onPriceChnage = { (tag,value,index) in
			self.listShopping[index.row].price = value
			self.calculate()
		}
		
		return cell
	}
}
