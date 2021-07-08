//
//  DateExtension.swift
//  Vendas
//
//  Created by itechnotion on 11/07/19.
//  Copyright © 2019 itechnotion. All rights reserved.
//

import Foundation
import UIKit

extension Calendar {
    static let gregorian = Calendar(identifier: .gregorian)
}

extension Date {
	func calculateAge(dob : String,toDate : String) -> (year :Int, month : Int, day : Int){
		let df = DateFormatter()
		df.dateFormat = "dd-MM-yyyy"
		let date = df.date(from: dob)
		guard let val = date else{
			return (0, 0, 0)
		}
		let cd = df.date(from: toDate)
		guard let clDate = cd else{
			return (0, 0, 0)
		}
		var years = 0
		var months = 0
		var days = 0
		let cal = NSCalendar.current
		years = cal.component(.year, from: clDate) -  cal.component(.year, from: val)
		let currMonth = cal.component(.month, from: clDate)
		let birthMonth = cal.component(.month, from: val)
		let dayt = cal.component(.day, from: clDate)
		let dayb = cal.component(.day, from:val)
		
		months = currMonth - birthMonth
		
		if months < 0
		{
			years = years - 1
			months = 12 - birthMonth + currMonth
			if cal.component(.day, from: clDate) < cal.component(.day, from: val){
				months = months - 1
			}
		} else if months == 0 && cal.component(.day, from: clDate) < cal.component(.day, from: val)
		{
			years = years - 1
			months = 11
		}else{
			if dayt < dayb{
				months = months - 1
			}
		}
		if cal.component(.day, from: clDate) > cal.component(.day, from: val){
			days = cal.component(.day, from: clDate) - cal.component(.day, from: val)
		}
		else if cal.component(.day, from: clDate) < cal.component(.day, from: val)
		{
			let today = cal.component(.day, from: clDate)
			let date = cal.date(byAdding: .month, value: -1, to: clDate)
			days = date!.daysInMonth - cal.component(.day, from: val) + today
		} else
		{
			days = 0
			if months == 12
			{
				years = years + 1
				months = 0
			}
		}
		return (years, months, days)
	}
	func checkNextBirthday(birthDate : String) -> (year :Int, month : Int, day : Int){
		let current = Date().dayMonthYear(currentDate: Date().today)
		let birth = Date().dayMonthYear(currentDate: birthDate)
		var newDate = ""
		
		if current.month > birth.month{
			newDate = "\(birth.day)-\(birth.month)-\(current.year + 1)"
			return  Date().calculateAge(dob:  Date().today, toDate: newDate)
		}else if current.month == birth.month{
			let dayB = Int(birth.day)!
			let dayC = Int(current.day)!
			if dayB > dayC{
				newDate = "\(birth.day)-\(birth.month)-\(current.year)"
			}else{
				newDate = "\(birth.day)-\(birth.month)-\(current.year+1)"
			}
		}else{
			newDate = "\(birth.day)-\(birth.month)-\(current.year)"
		}
		
		return  Date().calculateAge(dob: Date().today, toDate: newDate)
		
	}
	var todayTransaction : String{ //Use
		let formatter = DateFormatter()
		formatter.dateFormat = "dd-MM-yy hh:mm a"
		let CreatedDate = formatter.string(from: Date())
		return CreatedDate
	}
	var daysInMonth:Int{ //Age Convert day
		   let calendar = Calendar.current
		   let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
		   let date = calendar.date(from: dateComponents)!
		   let range = calendar.range(of: .day, in: .month, for: date)!
		   let numDays = range.count
		   return numDays
	   }

	var today : String{ //Use
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let CreatedDate = formatter.string(from: Date())
        return CreatedDate
    }
	var todaySplitYear : String{ //Use
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        let CreatedDate = formatter.string(from: Date())
        return CreatedDate
    }
	func dayMonthYear(currentDate date: String) -> (year :Int, month : String, day : String){
		   let dateFormatter = DateFormatter()
		   dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
		   let date = dateFormatter.date(from: date) //according to date format your date string
		   dateFormatter.dateFormat = "dd" //Your date format
		   let day = dateFormatter.string(from: date!)
			dateFormatter.dateFormat = "MM" //Your date format
			let mon = dateFormatter.string(from: date!)
		   dateFormatter.dateFormat = "yyyy" //Your date format
			let year = dateFormatter.string(from: date!)
			return (Int(year)!,mon,day)
	   }
	func getDayOfWeek(_ today:String) -> String {
		let formatter  = DateFormatter()
		formatter.dateFormat = "dd-MM-yyyy"
		guard let todayDate = formatter.date(from: today) else { return "" }
		let myCalendar = Calendar(identifier: .gregorian)
		let weekDay = myCalendar.component(.weekday, from: todayDate)
	
		switch weekDay {
			case 1:
				return "Sunday"
			break
			case 2:
				return "Monday"
			break
			case 3:
				return "Tuesday"
			break
			case 4:
				return "Wednesday"
			break
			case 5:
				return "Thursday"
			break
			case 6:
				return "Friday"
			break
			case 7:
				return "Saturday"
			break
			
			default:
				return "weekDay"
			break
		}
	}
	func changeDDMMM(currentDate date: String) -> String {
		  let dateFormatter = DateFormatter()
		  dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
		  let date = dateFormatter.date(from: date) //according to date format your date string
		  dateFormatter.dateFormat = "MMM dd,yyyy" //Your date format
		  let resultString = dateFormatter.string(from: date!)
		  return resultString
	  }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var tomorrow: String {
        let date = Calendar.current.date(byAdding: .day, value: 1, to: noon)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let CreatedDate = formatter.string(from: date) // string purpose I add here
        return CreatedDate
    }
    var startOfWeek: Date? {
        return Calendar.gregorian.date(from: Calendar.gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
    }
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 6, to: sunday)
    }
    var currentDate : String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let CreatedDate = formatter.string(from: Date()) // string purpose I add here
        return CreatedDate
    }
    
    var apiCurrentDate : String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let CreatedDate = formatter.string(from: Date()) // string purpose I add here
        return CreatedDate.appending(" 00:00:00")
    }
    
    
    func convertDateZ(date : String) -> String{
//        yyyy-MM-dd'T'HH:mm:ssZ
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        let myString = formatter.date(from: date) // string purpose I add here
//        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
//        let fromDate = formatter.string(from: myString!)
//        
//        
        
        let str = date
//        let formato = DateFormatter()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        formatter.formatterBehavior = .default
        let data = formatter.date(from: str)
        
//        let myString = formatter.date(from: data) // string purpose I add here
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
             
        let fromDate = formatter.string(from: data!)
        return fromDate

    }
    func convertDateddmmyyyyZ(date : String) -> String{
        let str = date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        formatter.formatterBehavior = .default
        let data = formatter.date(from: str)
        //        let myString = formatter.date(from: data) // string purpose I add here
        formatter.dateFormat = "dd-MM-yyyy"
        
        let fromDate = formatter.string(from: data!)
        return fromDate
        
    }
    func convertDateDDMMMZ(date : String) -> String{
        let str = date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        formatter.formatterBehavior = .default
        let data = formatter.date(from: str)
        formatter.dateFormat = "dd-MMM"
        let fromDate = formatter.string(from: data!)
        return fromDate
    }
    
    func changeFormatReverseWeb(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    
    func convertDay(date : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.date(from: date) // string purpose I add here
        formatter.dateFormat = "HH"
        let fromDate = formatter.string(from: myString!)
        return fromDate
    }
    
    func convertDate(date : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.date(from: date) // string purpose I add here
        formatter.dateFormat = "MM-yyyy"
        let fromDate = formatter.string(from: myString!)
        return fromDate
        
    }
    
    func convertTime(date : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.date(from: date) // string purpose I add here
        formatter.dateFormat = "hh:mm a"
        let fromDate = formatter.string(from: myString!)
        return fromDate
    }
	func getWeeekDayFromT(days : Int, startDate : String) -> String{
		  var tenDaysfromNow: NSDate {
			  //            let today = startDate
			  let isoDate = startDate
			  
			  let dateFormatter = DateFormatter()
			  dateFormatter.dateFormat = "dd-MM-yyyy"
			  dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
			  let dateValue = dateFormatter.date(from:isoDate)!
			  return Calendar.current.date(byAdding: .day, value: days, to: dateValue)! as NSDate
		  }
		  let dateFormatter = DateFormatter()
		  //        let formateDate = dateFormatter.date(from:string)!
		  dateFormatter.dateFormat = "dd-MM-yyyy" // Output Formated
		  
		  //        print ("Print :\(dateFormatter.string(from: tenDaysfromNow))")//Print :02-02-2018
		  return dateFormatter.string(from: tenDaysfromNow as Date)
		  
		  //        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +0000"
		  
		  //        print(tenDaysfromNow)
	  }
    func getWeeekDayFromToday(days : Int, startDate : String) -> String{
        var tenDaysfromNow: NSDate {
            //            let today = startDate
            let isoDate = startDate
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            let dateValue = dateFormatter.date(from:isoDate)!
            return Calendar.current.date(byAdding: .day, value: days, to: dateValue)! as NSDate
        }
        let dateFormatter = DateFormatter()
        //        let formateDate = dateFormatter.date(from:string)!
        dateFormatter.dateFormat = "dd-MM" // Output Formated
        
        //        print ("Print :\(dateFormatter.string(from: tenDaysfromNow))")//Print :02-02-2018
        return dateFormatter.string(from: tenDaysfromNow as Date)
        
        //        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +0000"
        
        //        print(tenDaysfromNow)
    }
    
  
    
    func differenceMinutes(ofComponent comp: Calendar.Component, fromDate startDate: String, endDate : String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let date = dateFormatter.date(from: startDate) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let to = dateFormatter.date(from: endDate)
        
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date!) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: to!) else { return 0 }
        return end - start
    }
    func differenceHours(ofComponent comp: Calendar.Component, fromDate startDate: String, endDate : String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let date = dateFormatter.date(from: startDate) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let to = dateFormatter.date(from: endDate)
        
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date!) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: to!) else { return 0 }
        return end - start
    }
    
    func changeFormat(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm:ss a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        
        return resultString
    }
    func changeDateFormat(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeAbsentFormat(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeTimeFormat(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        
        return resultString
    }
    func convertDatetoString(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: date) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fromDate = formatter.string(from: yourDate!)
        return fromDate
    }
    func changeFormatHistory(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd\nMMM\nyyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateFormate(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateFormateer(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeLateDataFormat(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeLateDataFormatHoliday(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeSelectedDataFormat(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateToMonth(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "MMM-yy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateFormatterHistory(currentDate date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeTimeFormatterHistory(currentDate date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        
        print(resultString)
        return resultString
    }
    func changeDateFormatHistory(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "dd" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateToTime(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        //        2019-02-28 15:19:30
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateTime(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        //        2019-02-28 15:19:30
        dateFormatter.dateFormat = "HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDateTimeShift(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        //        2019-02-28 15:19:30
        dateFormatter.dateFormat = "HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    
    func changeTime(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "HH:mm" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    
    func convertTimetoString(date : Date) -> String{
        let locale = NSLocale.current
        let formatterDevice : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        var formate = "hh:mm a"
        if formatterDevice.contains("a") {
            print("phone is set to 12 hours")
            formate = "hh:mm a"
        } else {
            formate = "HH:mm:ss"
            print("phone is set to 24 hours")
        }
        
        let formatter = DateFormatter()
        let formattert = DateFormatter()
        formatter.dateFormat = formate
        let myString = formatter.string(from: date) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formattert.dateFormat = "hh:mm a"
        let fromDate = formattert.string(from: yourDate!)
        
        print(fromDate)
        return fromDate
    }
    
    func converTimeString(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "HH:mm:ss" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeFormatReverse(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeFormatReverseWithTime(currentDate date: String) -> String {
        let dateFormatter = DateFormatter()
        //        16-03-2019 03:33:00
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: date) //according to date format your date string
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func convertNextDate(dateString : String) -> String{    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let myDate = dateFormatter.date(from: dateString)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: myDate)
        let somedateString = dateFormatter.string(from: tomorrow!)
        //        print("your next Date is \(somedateString)")
        return somedateString
    }
    func historyDate(fromDate startDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: startDate) //according to date format your date string
        dateFormatter.dateFormat = "EEEE, MMM d" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func historyTime(fromDate startDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
        let date = dateFormatter.date(from: startDate) //according to date format your date string
        dateFormatter.dateFormat = "hh:mm a" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    func changeDay(fromDate startDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" //Your date format
        let date = dateFormatter.date(from: startDate) //according to date format your date string
        dateFormatter.dateFormat = "EEE" //Your date format
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }

    func getMonthYear()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date()) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMMM yyyy"
        let fromDate = formatter.string(from: yourDate!)
        return fromDate
    }
    
    func monthYear() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date()) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "yyyy"
        let fromDate = formatter.string(from: yourDate!)
        return fromDate
    }
}
