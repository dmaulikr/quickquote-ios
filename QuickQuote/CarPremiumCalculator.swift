//
//  CarPremiumCalculator.swift
//  QuickQuote


import Foundation

class CarPremiumCalculator
{
    var basePremium = 10.0;
    var genderFactors = ["male":1.25,"female":1.15];
    var ageFactor = 1.2;
    var stateFactors = ["nsw":1.1,"vic":1.2,"sa":1.3,"wa":1.4,"tas":1.5,"qld":1.6];
    var makeFactors = ["audi":1.0,"alfa":1.1,"bmw":1.2,"lexus":1.3,"toyota":1.4,"vw":1.5];
    
    
    init() {}
    
    func getPremiumForQuote(quote: CarQuote) -> Double
    {
        var premium = basePremium + ageFactor * Double(quote.age) * Double(genderFactors[quote.gender]!) * Double(stateFactors[quote.state]!)  * Double(makeFactors[ quote.make]!);
        return premium;
    }
    
    func getPremiumForQuoteAsString(quote: CarQuote) -> String
    {
        let premium = getPremiumForQuote(quote);
        let formattedPremium = "$\(premium)";
        return formattedPremium;
    }
    
}
