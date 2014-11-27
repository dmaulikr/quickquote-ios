//
//  Quote.swift
//  QuickQuote

import Foundation



class Quote
{
    var type: String;
    var age: Int;
    var gender: String;
    var state: String;
    
    
    init(type: String, age: Int, gender:String, state:String)
    {
        self.type = type;
        self.age = age;
        self.gender = gender;
        self.state = state;
    }
    

}

class CarQuote : Quote
{
    var make: String;
    var year: Int;
    
    
    init(age: Int, gender:String, state:String, make:String, year:Int)
    {
        
        self.make = make;
        self.year = year;
        
        super.init(type: "car", age: age, gender: gender, state: state);
    }
}
