//
//  CarQuoteViewController.swift
//  QuickQuote
//

import UIKit




class CarQuoteViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var makeOfCar: UITextField!
    @IBOutlet weak var yearOfManufacture: UITextField!
    @IBOutlet weak var ageOfDriver: UITextField!
    @IBOutlet weak var stateOfResidence: UITextField!
    @IBOutlet weak var driversEmailAddress: UITextField!
    
    @IBOutlet weak var premium: UILabel!
   
    @IBAction func getQuote(sender: UIButton) {
        CalculateQuote();
    }
    
    let carMakesArray = ["Audi","Alfa Romeo","BMW","Lexus", "Toyota", "Volkswagen"];
    let statesArray = ["New South Wales","Queensland","South Australia","Tasmania", "Victoria", "Western Australia"];
    let genders = ["Male", "Female"];
    
    let carMakePicker = UIPickerView(frame: CGRect(x: 0, y: 50, width: 100, height: 150));
    let statePicker = UIPickerView(frame: CGRect(x: 0, y: 50, width: 100, height: 150));
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        let inputAccessoryView = UIToolbar(frame:CGRect(x: 150, y: 50, width: 100, height: 40));
        let stateInputAccessoryView = UIToolbar(frame:CGRect(x: 150, y: 50, width: 100, height: 40));
        
        var a = UIBarButtonItem(title: "Done", style: .Plain, target: self, action:"ClickedMakeOfCarDone");
        var b = UIBarButtonItem(title: "Done", style: .Plain, target: self, action:"ClickedStateDone");

        inputAccessoryView.setItems([a], animated: false);
        stateInputAccessoryView.setItems([b], animated: false);
        
        
        
        carMakePicker.dataSource = self;
        carMakePicker.delegate = self;
        carMakePicker.showsSelectionIndicator = true;
        
        makeOfCar.inputAccessoryView = inputAccessoryView;
        makeOfCar.inputView = carMakePicker;
        
        statePicker.dataSource = self;
        statePicker.delegate = self;
        
        stateOfResidence.inputAccessoryView = stateInputAccessoryView;
        stateOfResidence.inputView = statePicker;
        
        self.ageOfDriver.delegate = self;
        self.yearOfManufacture.delegate = self;
        self.driversEmailAddress.delegate = self;
    
        
        premium.hidden = true;

    }
    
    func ClickedMakeOfCarDone()
    {
        makeOfCar.text = carMakesArray[carMakePicker.selectedRowInComponent(0)];
        makeOfCar.resignFirstResponder();
    }
    
    
    func ClickedStateDone()
    {
        stateOfResidence.text = statesArray[statePicker.selectedRowInComponent(0)];
        stateOfResidence.resignFirstResponder();
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true);
        self.navigationController?.title = "QuickQuote";
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true);    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
    
    
    func CalculateQuote()
    {
        premium.hidden = false;
        var quote = CarQuote(age:23,email:"a@a.com",gender:"male",state:"nsw",make:"bmw",year:2004);
        
        premium.text = CarPremiumCalculator().getPremiumForQuoteAsString(quote);
        premium.accessibilityLabel = premium.text;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
     
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (pickerView == carMakePicker)
        {
            return carMakesArray.count;
        }
        else
        {
            return statesArray.count;
        }
        
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if (pickerView == carMakePicker)
        {
            // Tag 0 is the car make UIPickerView
            return carMakesArray[row]
        }
        else
        {
            return statesArray[row];
        }
    }

    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder();
        return true;
    }
  
}

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


