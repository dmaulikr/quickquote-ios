//
//  CarPremiumCalculator.swift
//  QuickQuote


import Foundation

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self) as String
    }
}

class CarPremiumCalculator
{
    var basePremium = 10.0;
    var genderFactors = ["Male":1.25,"Female":1.15];
    var ageFactor = 1.2;
    var stateFactors = ["New South Wales":1.1,"Victoria":1.2,"South Australia":1.3,"Western Australia":1.4,"Tasmania":1.5,"Queensland":1.6];
    var makeFactors = ["Audi":1.0,"Alfa Romeo":1.1,"BMW":1.2,"lexus":1.3,"Toyota":1.4,"Volkswagen":1.5];
    
    
    init() {}
    
    func getPremiumForQuote(quote: CarQuote) -> Double
    {
        var premium = basePremium + ageFactor * Double(quote.age) * Double(genderFactors[quote.gender]!) * Double(stateFactors[quote.state]!)  * Double(makeFactors[ quote.make]!);
        return premium;
    }
    
    func getPremiumForQuoteAsString(quote: CarQuote) -> String
    {
        let premium = getPremiumForQuote(quote).format((".2"));
        let formattedPremium = "$\(premium)";
        return formattedPremium;
    }
    
    
}
