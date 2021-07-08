//
//  SettingVC.swift
//  Economy Calculator
//
//  Created by Rohit Kanani on 16/12/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
	@IBOutlet weak var viewTheme : UIView!
	@IBOutlet weak var viewButton : UIView!
	@IBOutlet weak var viewInput : UIView!
	@IBOutlet weak var imgExpand : UIImageView!
	@IBOutlet weak var imgExpand2 : UIImageView!
	@IBOutlet weak var imgExpand3 : UIImageView!
	
	@IBOutlet weak var collectionTheme : UICollectionView!
	@IBOutlet weak var collectionButton : UICollectionView!
	@IBOutlet weak var collectionInput : UICollectionView!
	
	@IBOutlet weak var heightTheme : NSLayoutConstraint!
	@IBOutlet weak var heightButton : NSLayoutConstraint!
	@IBOutlet weak var heightInput : NSLayoutConstraint!
	var arrayColor = ["5AC8FA","FFFFFF","0955F2","6D6D6D","BABABA","E2E2E2","EF171E","23BB2A","0955F2","F07708","F1B709","856743","EF003B","8C2FBD","717176","094FD1","BABABA","C1D7F9","D783FF","FF85FF","FF8AD8","AF4DE4","60155D","EDB722"]
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.heightTheme.constant = 0
		self.heightButton.constant = 0
		self.heightInput.constant = 0
		imgExpand.tintColor = .white
		imgExpand2.tintColor = .white
		imgExpand3.tintColor = .white
		collectionTheme.register(ColorCell.nib, forCellWithReuseIdentifier: ColorCell.identifier)
		collectionButton.register(ColorCell.nib, forCellWithReuseIdentifier: ColorCell.identifier)
		collectionInput.register(ColorCell.nib, forCellWithReuseIdentifier: ColorCell.identifier)
		self.view.backgroundColor = UIColor().hexStringToUIColor(hex: appDelegate.viewBackgroundColor)
    }
	
	@IBAction func actionBack(_ sender : UIButton){
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func actionSelect(_ sender : UIButton){
		if sender.tag == 1{
			if heightButton.constant > 0{
				self.expandButton()
			}else if heightInput.constant > 0{
				self.expandInput()
			}
			if heightTheme.constant > 0{
				self.expandTheme()
			}else{
				UIView .transition(with: viewTheme, duration: 2, options: .transitionCurlDown,
				animations: {
//					   self.heightTheme.constant = 100
					   }, completion: nil)
				
				UIView.animate(withDuration: 1,
						   delay: 0,
						   options: UIView.AnimationOptions.transitionCurlDown,
						   animations: { () -> Void in
							UIView.animate(withDuration: 2.0, animations: {
							   self.imgExpand.transform = self.imgExpand.transform.rotated(by: CGFloat(Double.pi))
							})
							self.heightTheme.constant = 100
							self.view.layoutIfNeeded()
				}, completion: { (finished) -> Void in

				})
			}
		}else if sender.tag == 2{
			if heightTheme.constant > 0{
				self.expandTheme()
			}else if heightInput.constant > 0{
				self.expandInput()
			}
			if heightButton.constant > 0{
				self.expandButton()
			}else{
				UIView .transition(with: viewButton, duration: 2, options: .transitionCurlDown,
								   animations: {
									//					   self.heightTheme.constant = 100
				}, completion: nil)
				
				UIView.animate(withDuration: 1,
							   delay: 0,
							   options: UIView.AnimationOptions.transitionCurlDown,
							   animations: { () -> Void in
								UIView.animate(withDuration: 2.0, animations: {
									self.imgExpand2.transform = self.imgExpand2.transform.rotated(by: CGFloat(Double.pi))
								})
								self.heightButton.constant = 100
								self.view.layoutIfNeeded()
				}, completion: { (finished) -> Void in
					
				})
			}
		}else if sender.tag == 3{
			if heightButton.constant > 0{
				self.expandButton()
			}else if heightTheme.constant > 0{
				self.expandTheme()
			}
			if heightInput.constant > 0{
				self.expandInput()
			}else{
				UIView .transition(with: viewInput, duration: 2, options: .transitionCurlDown,
								   animations: {
									//					   self.heightTheme.constant = 100
				}, completion: nil)
				
				UIView.animate(withDuration: 1,
							   delay: 0,
							   options: UIView.AnimationOptions.transitionCurlDown,
							   animations: { () -> Void in
								UIView.animate(withDuration: 2.0, animations: {
									self.imgExpand3.transform = self.imgExpand3.transform.rotated(by: CGFloat(Double.pi))
								})
								self.heightInput.constant = 100
								self.view.layoutIfNeeded()
				}, completion: { (finished) -> Void in
					
				})
			}
		}
	}
	func expandTheme(){
		UIView .transition(with: viewTheme, duration: 2, options: .transitionCurlUp,
						   animations: {
							//					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
							//						self.heightTheme.constant = 0
							//					}
		}, completion: nil)
		
		UIView.animate(withDuration: 1,
					   delay: 0.5,
					   options: UIView.AnimationOptions.transitionCurlUp,
					   animations: { () -> Void in
						UIView.animate(withDuration: 2.0, animations: {
							self.imgExpand.transform = self.imgExpand.transform.rotated(by: CGFloat(Double.pi ))
						})
						self.heightTheme.constant = 0
						self.view.layoutIfNeeded()
		}, completion: { (finished) -> Void in
			
		})
	}
	func expandButton(){
		UIView .transition(with: viewButton, duration: 2, options: .transitionCurlUp,
						   animations: {
		}, completion: nil)
		
		UIView.animate(withDuration: 1,
					   delay: 0.5,
					   options: UIView.AnimationOptions.transitionCurlUp,
					   animations: { () -> Void in
						UIView.animate(withDuration: 2.0, animations: {
							self.imgExpand2.transform = self.imgExpand2.transform.rotated(by: CGFloat(Double.pi ))
						})
						self.heightButton.constant = 0
						self.view.layoutIfNeeded()
		}, completion: { (finished) -> Void in
			
		})
	}
	func expandInput(){
		UIView .transition(with: viewInput, duration: 2, options: .transitionCurlUp,
						   animations: {
		}, completion: nil)
		
		UIView.animate(withDuration: 1,
					   delay: 0.5,
					   options: UIView.AnimationOptions.transitionCurlUp,
					   animations: { () -> Void in
						UIView.animate(withDuration: 2.0, animations: {
							self.imgExpand3.transform = self.imgExpand3.transform.rotated(by: CGFloat(Double.pi ))
						})
						self.heightInput.constant = 0
						self.view.layoutIfNeeded()
		}, completion: { (finished) -> Void in
			
		})
	}
}

extension SettingVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return arrayColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.identifier, for: indexPath as IndexPath) as! ColorCell
		cell.viewBack.backgroundColor = UIColor().hexStringToUIColor(hex: arrayColor[indexPath.row])
//		let view = cell.contentView.viewWithTag(1) as! UIView
//		view.cornerRadius = 10
//        view.backgroundColor = UIColor().hexStringToUIColor(hex: arrayColor[indexPath.row])
		return cell
    }
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		  return CGSize(width: 80, height: 80)
	  }
	  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionTheme{
			self.view.backgroundColor = UIColor().hexStringToUIColor(hex: arrayColor[indexPath.row])
			appDelegate.viewBackgroundColor = arrayColor[indexPath.row]
        }else if collectionView == collectionButton{
			self.expandButton()
            appDelegate.buttonBackgroundColor = arrayColor[indexPath.row]
		}else{
			self.expandInput()
			appDelegate.inputBackgroundColor = arrayColor[indexPath.row]
		}
        
    }
}
