//
//  Quote.swift
//  QuickQuote
//
//  Created by Bruce Mcleod on 20/11/2014.
//  Copyright (c) 2014 Bruce Mcleod. All rights reserved.
//

import Foundation


class Quote
{
    var type: String;
    var age: Int;
    var email: String;
    var gender: String;
    var state: String;
    
    var states = ["nsw":"New South Wales", "vic":"Victoria", "tas":"Tasmania", "wa":"Western Australia", "sa":"South Australia", "qld":"Queensland"];
    var genders = ["male":"Male", "female":"Female"];
    var types = ["life":"Life Insurance", "car":"Car Insurance"];
    
    init(type: String, age: Int, email: String, gender:String, state:String)
    {
        self.type = type;
        self.age = age;
        self.email = email;
        self.gender = gender;
        self.state = state;
    }
    
    func namedState() -> String
    {
        return states[state]!;
    }
    
    func namedGender() -> String
    {
        return genders[gender]!;
    }
    
    func namedType() -> String
    {
        return types[type]!;
    }
}

class CarQuote : Quote
{
    var makes = ["audi":"Audi", "alfa":"Alfa Romeo", "bmw":"BMW", "lexus":"Lexus", "toyota":"Toyota", "vw":"Volkswagen"];
    var make: String;
    var year: Int;
    
    
    init(age: Int, email: String, gender:String, state:String, make:String, year:Int)
    {
        
        self.make = make;
        self.year = year;
        
        super.init(type: "car", age: age, email: email, gender: gender, state: state);
    }
}
