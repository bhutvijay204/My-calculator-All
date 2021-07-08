//
//  ViewControllerExtension.swift
//  Vendas
//
//  Created by itechnotion on 11/07/19.
//  Copyright © 2019 itechnotion. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
var BASEURL = "http://vendas_dev.itechnotion.com/"

extension UIViewController {
    var isModal: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
}

extension UIViewController {
    //MARK:- User define methods
	func setLiteColor(){
		self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
	}
	func setDarkColor(){
		self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
	}
	
	
    func ShowAlertMessageGloble(title : String, message: String, buttonText : String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func alertOkAction(title : String, message: String, buttonSettings : String,buttonText : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
	 func getWebData(method : String = "POST", webURL : String, parameters: String, completion:(([String:Any],(Int))->())?) {
		  
		  Web.webserviceFetch(method: method, webURL: webURL, parameters: parameters) { (parsedData,error,httpResponse) in
			  
			  if(error){
				  self.ShowAlertMessageGloble(title: "", message: "Please check network connection and try again.", buttonText: "OK")
				  DispatchQueue.main.async {
					  let parsedData1:[String:Any] = [  // ["b": 12]
						  "A":"Please check network connection and try again.",
					  ]
					  completion?(parsedData1,1)
				  }
			  }else if httpResponse.statusCode >= 200 && httpResponse.statusCode <= 300{
				  DispatchQueue.main.async {
					  completion?(parsedData,2)
				  }
			  }else if httpResponse.statusCode == 401{
				  var Error : String!
				  Error = (parsedData["message"] as! String)
				  self.ShowAlertMessageGloble(title: "", message: Error, buttonText: "OK")
				  DispatchQueue.main.async {
					  let parsedData1:[String:Any] = [  // ["b": 12]
						  "A":"401",
					  ]
					  completion?(parsedData1,3)
				  }
			  }
		  }
	  }
	
}


class Web{
    
    static let web_managed_gps_clients = "managed_gps_clients"
    
    static func webserviceFetch(method : String = "POST", webURL : String, parameters: String, completion:(([String:Any],(Bool),(HTTPURLResponse))->())?) {
        var urlPath = ""
        urlPath = BASEURL.appending(webURL)
        if method == "GET" || method == "DELETE"{
            urlPath = "https://free.currconv.com/api/v7/convert?q=\(parameters)&compact=y&apiKey=a432c22ea638bf2f2b33"//urlPath.appending(parameters)
        }
        let url = NSURL(string:urlPath as String)
        print(url!)
        var request = URLRequest(url: url! as URL)
        if method == "POST" || method == "PUT" {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.httpMethod = method
        if method == "POST" || method == "PUT" {
            request.httpBody = parameters.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            print("error \(String(describing: httpResponse?.statusCode))")
            
            if error != nil {
                DispatchQueue.main.async {
                    let parsedData:[String:Any] = [  // ["b": 12]
                        "A":"A",
                    ]
                    completion?(parsedData,true,HTTPURLResponse())
                }
            }
            guard let data = data, error == nil else {
                print(error!)                                 // some fundamental network error
                return
            }
            do {
                if let parsedData = try? (JSONSerialization.jsonObject(with: data) as! [String:Any]) {
                    DispatchQueue.main.async {
                        completion?(parsedData, false,httpResponse!)
                    }
                }else{
                    
                }
            }
        }
        task.resume()
    }
    
}
