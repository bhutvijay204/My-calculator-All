//
//  CreateTable.swift
//  StudyClock
//
//  Created by itechnotion-mac1 on 16/04/18.
//  Copyright © 2018 itechnotion-mac1. All rights reserved.
//


import Foundation
import SQLite3

enum CType : String{
    case notes = "Notes"
    case coins = "Coins"
}

    var db: OpaquePointer?
    var dbs: OpaquePointer?
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    .appendingPathComponent("age.sqlite")

func createTables(){
    print(fileURL)
    userRolTable()
    usersTable()
	eventTable()
	memberTable()
	currency()
	insertAllData()
}

//1
func userRolTable(){
    //////print(fileURL)
    
    //opening the database
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        //////print("error opening database")
    }
    //creating table
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS user_role (id INTEGER PRIMARY KEY AUTOINCREMENT,server_id INTEGER DEFAULT NULL, type TEXT)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        //////print("error creating table: \(errmsg)")
    }
}
//2
func usersTable(){
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        //////print("error opening database")
    }
    //creating table
    
//    PRIMARY KEY (`user_id`),
//    KEY `role_id` (`role_id`)
    
    
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS users (user_id INTEGER PRIMARY KEY AUTOINCREMENT,server_id INTEGER DEFAULT NULL,name TEXT DEFAULT NULL,password TEXT DEFAULT NULL,email TEXT UNIQUE,mobile TEXT DEFAULT NULL,role_id INTEGER NOT NULL,currency TEXT DEFAULT NULL,is_deleted INTEGER DEFAULT NULL,created_date TEXT DEFAULT NULL,updated_date TEXT DEFAULT NULL)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        //////print("error creating table: \(errmsg)")
        //,FOREIGN KEY(role_id) REFERENCES user_role(id)
    }

}


//3


func eventTable(){
    //////print(fileURL)
    
    //opening the database
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        //////print("error opening database")
    }
    //creating table
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS events (id INTEGER PRIMARY KEY AUTOINCREMENT,event_name TEXT UNIQUE,is_deleted INTEGER DEFAULT NULL,created_date TEXT DEFAULT NULL,updated_date TEXT DEFAULT NULL)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        //////print("error creating table: \(errmsg)")
    }
}
func currency(){
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        //////print("error opening database")
    }
    //creating table
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS currency (id INTEGER PRIMARY KEY AUTOINCREMENT,currency INTEGER DEFAULT NULL,type TEXT DEFAULT NULL,currency_type TEXT UNIQUE,is_active INTEGER DEFAULT NULL,is_deleted INTEGER DEFAULT NULL,created_date TEXT DEFAULT NULL,updated_date TEXT DEFAULT NULL)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error creating table: \(errmsg)")
    }
}

func memberTable(){
    //////print(fileURL)
    
    //opening the database
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        //////print("error opening database")
    }
    //creating table
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS member (id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER NOT NULL,member_name TEXT,event_date TEXT NOT NULL,event_name TEXT NOT NULL,member_event  TEXT UNIQUE,is_deleted INTEGER DEFAULT NULL,created_date TEXT DEFAULT NULL,updated_date TEXT DEFAULT NULL)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        //////print("error creating table: \(errmsg)")
    }
}

func insertAllData(){
	appDelegate.LOGINDETAIL.USERID = 2
	appDelegate.LOGINDETAIL.USERNAME = "Rakesh"
	appDelegate.LOGINDETAIL.EMAIL = "rakesh@gmail.com"
	appDelegate.LOGINDETAIL.PASSWORD = "123456"
	appDelegate.LOGINDETAIL.CURRENCY = "INR"
	createUser(name: "Guest", email: "guest@gmail.com", password: "123456", mobile: "9874563201") { (status, message) in
		createUser(name: "Rakesh", email: "rakesh@gmail.com", password: "123456", mobile: "9874563201") { (status, message) in
		}
	}
	addEvents(name: "Birthday") { (status, message) in
		addEvents(name: "Anniversary") { (status, message) in
			
		}
	}
	addMembers(name: "Rajesh", event_date:  "19-09-1992", event_name: "Birthday") { (status, message) in
		addMembers(name: "Pankaj", event_date:  "24-04-1990", event_name: "Birthday") { (status, message) in
			addMembers(name: "Myank", event_date:  "02-06-1991", event_name: "Birthday") { (status, message) in
				addMembers(name: "Divya", event_date:  "18-02-1993", event_name: "Birthday") { (status, message) in
					addMembers(name: "Viral", event_date:  "24-12-1999", event_name: "Birthday") { (status, message) in
						addMembers(name: "Pankaj", event_date:  "12-03-2019", event_name: "Anniversary") { (status, message) in
							addMembers(name: "Myank", event_date:  "24-01-2018", event_name: "Anniversary") { (status, message) in
								
							}
						}
					}
				}
			}
		}
	}
	
	addcurrency(currency: 2000, type: CType.notes.rawValue) { (status, message) in
		addcurrency(currency: 500, type: CType.notes.rawValue) { (status, message) in
			addcurrency(currency: 200, type: CType.notes.rawValue) { (status, message) in
				addcurrency(currency: 100, type: CType.notes.rawValue) { (status, message) in
					addcurrency(currency: 50, type: CType.notes.rawValue) { (status, message) in
						addcurrency(currency: 20, type: CType.notes.rawValue) { (status, message) in
							addcurrency(currency: 10, type: CType.notes.rawValue) { (status, message) in
								addcurrency(currency: 5, type: CType.notes.rawValue) { (status, message) in
									addcurrency(currency: 2, type: CType.notes.rawValue) { (status, message) in
										addcurrency(currency: 1, type: CType.notes.rawValue) { (status, message) in
											
										}
									}
								}
							}
						}
					}
				}
			}
		}
		addcurrency(currency: 10, type: CType.coins.rawValue) { (status, message) in
			addcurrency(currency: 5, type: CType.coins.rawValue) { (status, message) in
				addcurrency(currency: 2, type: CType.coins.rawValue) { (status, message) in
					addcurrency(currency: 1, type: CType.coins.rawValue) { (status, message) in
					}
				}
			}
		}
	}
}


func createUser(name : String,email : String,password : String,mobile : String, completion:((Int,String)->())?) {
    var st: OpaquePointer?
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        print("error opening database")
    }
    if sqlite3_open(fileURL.path, &st) != SQLITE_OK {
        print("error opening database")
    }
    //  let delete  = "DELETE FROM studyclock WHERE id = 1;"
    let queryString = "INSERT INTO users (name,email,password,mobile,role_id,currency,is_deleted,created_date,updated_date) VALUES (?,?,?,?,?,?,?,?,?)"
    if sqlite3_prepare(db, queryString, -1, &st, nil) != SQLITE_OK{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error preparing insert studyClockTable :- \(errmsg)")
        sqlite3_finalize(st);
        sqlite3_close(db);
        
        completion?(0,"Alreday exit")
        return
    }
    
    let isDelete = 0
    let created_date = Date().currentDate
    let updated_date = Date().currentDate
    
    //binding the parameters
    sqlite3_bind_text(st,1, (name as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,2, (email as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,3, (password as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,4, (mobile as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,5, ("2" as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,6, ("INR" as NSString).utf8String, -1, nil)
    sqlite3_bind_int(st,7, Int32(isDelete))
    sqlite3_bind_text(st,8, (created_date as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,9, (updated_date as NSString).utf8String, -1, nil)
    
    if sqlite3_step(st) != SQLITE_DONE {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("insertStartTime: \(errmsg)")
//        sqlite3_finalize(st);
//        sqlite3_close(db);
        
        completion?(0,"Alreday exit")
        return
    }else{
        print("Registerd")
        sqlite3_finalize(st);
        sqlite3_close(db);
        completion?(1,"Registerd sucessfully")
    }
}

func addEvents(name : String, completion:((Int,String)->())?) {
    var st: OpaquePointer?
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        print("error opening database")
    }
    if sqlite3_open(fileURL.path, &st) != SQLITE_OK {
        print("error opening database")
    }
    //  let delete  = "DELETE FROM studyclock WHERE id = 1;"
    let queryString = "INSERT INTO events (event_name,is_deleted,created_date,updated_date) VALUES (?,?,?,?)"
    if sqlite3_prepare(db, queryString, -1, &st, nil) != SQLITE_OK{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error preparing insert studyClockTable :- \(errmsg)")
        sqlite3_finalize(st);
        sqlite3_close(db);
        completion?(0,"Alreday exit")
        return
    }
    
    let isDelete = 0
    let created_date = Date().currentDate
    let updated_date = Date().currentDate
    
    //binding the parameters
    sqlite3_bind_text(st,1, (name as NSString).utf8String, -1, nil)
    sqlite3_bind_int(st,2, Int32(isDelete))
    sqlite3_bind_text(st,3, (created_date as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,4, (updated_date as NSString).utf8String, -1, nil)
    
    if sqlite3_step(st) != SQLITE_DONE {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        completion?(0,"Alreday exit")
        return
    }else{
        print("Registerd")
        sqlite3_finalize(st);
        sqlite3_close(db);
        completion?(1,"Added Sucessfully")
    }
}

func addMembers(name : String,event_date: String,event_name : String, completion:((Int,String)->())?) {
    var st: OpaquePointer?
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        print("error opening database")
    }
    if sqlite3_open(fileURL.path, &st) != SQLITE_OK {
        print("error opening database")
    }
    //  let delete  = "DELETE FROM studyclock WHERE id = 1;"
    let queryString = "INSERT INTO member (user_id,member_name,event_date,event_name,member_event,is_deleted,created_date,updated_date) VALUES (?,?,?,?,?,?,?,?)"
    if sqlite3_prepare(db, queryString, -1, &st, nil) != SQLITE_OK{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error preparing insert studyClockTable :- \(errmsg)")
        sqlite3_finalize(st);
        sqlite3_close(db);
        completion?(0,"Alreday exit")
        return
    }
    let user_id = appDelegate.LOGINDETAIL.USERID
    let isDelete = 0
    let created_date = Date().currentDate
    let updated_date = Date().currentDate
    let memberEvent = "\(name)\(event_name)"
    //binding the parameters
	sqlite3_bind_int(st,1, Int32(user_id))
    sqlite3_bind_text(st,2, (name as NSString).utf8String, -1, nil)
	sqlite3_bind_text(st,3, (event_date as NSString).utf8String, -1, nil)
	sqlite3_bind_text(st,4, (event_name as NSString).utf8String, -1, nil)
	sqlite3_bind_text(st,5, (memberEvent as NSString).utf8String, -1, nil)
    sqlite3_bind_int(st,6, Int32(isDelete))
    sqlite3_bind_text(st,7, (created_date as NSString).utf8String, -1, nil)
    sqlite3_bind_text(st,8, (updated_date as NSString).utf8String, -1, nil)
    
    if sqlite3_step(st) != SQLITE_DONE {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        completion?(0,"Alreday exit")
        return
    }else{
        print("Registerd")
        sqlite3_finalize(st);
        sqlite3_close(db);
        completion?(1,"Added Sucessfully")
    }
}

func addcurrency(currency : Int,type : String, completion:((Int,String)->())?) {
	var stmt: OpaquePointer?
	if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
		//////print("error opening database")
	}
	if sqlite3_open(fileURL.path, &stmt) != SQLITE_OK {
		//////print("error opening database")
	}
	let queryString = "INSERT INTO currency (currency,type,currency_type,is_active,is_deleted,created_date,updated_date) VALUES (?,?,?,?,?,?,?)"
	if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
		let errmsg = String(cString: sqlite3_errmsg(stmt)!)
		print("error preparing insert currency :- \(errmsg)")
	}
	let currencyType = "\(currency)\(type)"
	let created_date = Date().today
	let updated_date = Date().today
	
	sqlite3_bind_int(stmt,1, Int32(currency))
	sqlite3_bind_text(stmt,2, (type as NSString).utf8String, -1, nil)
	sqlite3_bind_text(stmt,3, (currencyType as NSString).utf8String, -1, nil)
	sqlite3_bind_int(stmt,4, Int32(1))
	sqlite3_bind_int(stmt,5, Int32(0))
	sqlite3_bind_text(stmt,6, (created_date as NSString).utf8String, -1, nil)
	sqlite3_bind_text(stmt,7, (updated_date as NSString).utf8String, -1, nil)
	
	if sqlite3_step(stmt) != SQLITE_DONE {
		let errmsg = String(cString: sqlite3_errmsg(db)!)
		print("Insert transaction : \(errmsg)")
		if errmsg == "SQL logic error"{
			
		}
		completion?(0,"")
	}else{
		sqlite3_finalize(stmt);
		sqlite3_close(db);
		completion?(1,"Added succesfully.")
	}
}
//--------------------****Select Data******-----------------------------------------
//--------------------****           ******-----------------------------------------

func getEvent(completion:((Int,[String])->())?) {
	var st: OpaquePointer?
	if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
		print("error opening database")
	}
	if sqlite3_open(fileURL.path, &st) != SQLITE_OK {
		print("error opening database")
	}
	
	let queryStringStudyClock = "SELECT event_name FROM events;"
	//////print(queryStringStudyClock)
	
	var eventList = [String]()
	if sqlite3_prepare(db, queryStringStudyClock, -1, &st, nil) != SQLITE_OK{
		let errmsg = String(cString: sqlite3_errmsg(db)!)
		//////print("error preparing studyclock get: \(errmsg)")
	}
	
	while(sqlite3_step(st) == SQLITE_ROW){
		eventList.append(String(cString: sqlite3_column_text(st, 0)))
	}
	sqlite3_finalize(st);
	sqlite3_close(db);
	completion?(1,eventList)
}

func getFemilyMembers(isAll : Bool,date : String, completion:((Int,[FemilyMember])->())?) {
	var st: OpaquePointer?
	if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
		print("error opening database")
	}
	if sqlite3_open(fileURL.path, &st) != SQLITE_OK {
		print("error opening database")
	}
	var queryStringStudyClock = ""
	if isAll{
			queryStringStudyClock = "SELECT id,user_id,member_name,event_date,event_name FROM member WHERE user_id=\(appDelegate.LOGINDETAIL.USERID);"
	}else{
			queryStringStudyClock = "SELECT id,user_id,member_name,event_date,event_name FROM member WHERE user_id=\(appDelegate.LOGINDETAIL.USERID) AND event_date  LIKE '%\(date)%';"
	}
	//////print(queryStringStudyClock)
	
	var eventList = [FemilyMember]()
	if sqlite3_prepare(db, queryStringStudyClock, -1, &st, nil) != SQLITE_OK{
		let errmsg = String(cString: sqlite3_errmsg(db)!)
		//////print("error preparing studyclock get: \(errmsg)")
	}
	
	while(sqlite3_step(st) == SQLITE_ROW){
		var event = FemilyMember()
		event.id =  Int(sqlite3_column_int(st, 0))
		event.user_id =  Int(sqlite3_column_int(st, 1))
		event.name = String(cString: sqlite3_column_text(st, 2))
		event.eventDate = String(cString: sqlite3_column_text(st, 3))
		event.eventName = String(cString: sqlite3_column_text(st, 4))
		let evDate = Date().calculateAge(dob: event.eventDate! , toDate: Date().today)
		event.duration = "Duration"
		event.durationTime = "\(evDate.year) year \(evDate.month) month \(evDate.day) day"
		let data = Date().checkNextBirthday(birthDate:  event.eventDate!)
		event.nextEventTime = "\(data.year) y \(data.month) m \(data.day) d"
		eventList.append(event)
	}
	
	sqlite3_finalize(st);
	sqlite3_close(db);
	completion?(1,eventList)
}
