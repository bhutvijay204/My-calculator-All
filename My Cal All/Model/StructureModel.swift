//
//  StructureModel.swift
//  Age Calculator
//
//  Created by Rohit Kanani on 12/10/19.
//  Copyright © 2019 Rohit Kanani. All rights reserved.
//

import Foundation
import UIKit

struct contollerView{
	var title : String?
	var image = UIImage()
	var view : String?
}

struct FemilyMember {
	var id : Int?
	var user_id : Int?
	var name : String?
	var eventName : String?
	var eventDate : String?
	var duration : String?
	var durationTime : String?
	var nextEvent : String?
	var nextEventTime : String?
}
struct NextSevenday{
	var femilyMemberList = [FemilyMember]()
	var date : String?
	var day : String?
}

struct Shopping{
	var iteam : String?
	var price : String?
}
struct Compound {
	var yearInterest : String?
	var totalInterest : String?
	var totalBalance : String?
}
struct SIP {
	var amount : String?
	var interest : String?
	var balance : String?
	var totalBalance : String?
}

struct CurrencyCT {
    var id : Int?
    var curreny : String?
    var total : String?
    var amount : String?
    var type : String?
    var isActive : Int?
}

struct History {
    var id : Int?
    var nt2000 : Int?
    var nt500 : Int?
    var nt200 : Int?
    var nt100 : Int?
    var nt50 : Int?
    var nt20 : Int?
    var nt10 : Int?
    var nt5 : Int?
    var nt2 : Int?
    var nt1 : Int?
    var co10 : Int?
    var co5 : Int?
    var co2 : Int?
    var co1 : Int?
    var total : Int?
    var total_coins : Int?
    var total_coins_value : Int?
    var total_notes : Int?
    var total_notes_value : Int?
    var remark : String?
    var is_deleted : Int?
    var created_date : String?
    var updated_date : String?
    
}



