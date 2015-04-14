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
     
    @IBOutlet weak var genderOfDriver: UISegmentedControl!

    @IBOutlet weak var getQuote: UIButton!
    @IBAction func getQuote(sender: UIButton) {
        CalculateQuote();
    }
    
    @IBOutlet weak var premium: UILabel!
   
    
    let carMakesArray = ["Audi","Alfa Romeo","BMW","Lexus", "Toyota", "Volkswagen"];
    let statesArray = ["New South Wales","Queensland","South Australia","Tasmania", "Victoria", "Western Australia"];
    let genders = ["Male", "Female"];
    
    let carMakePicker = UIPickerView(frame: CGRect(x: 0, y: 50, width: 100, height: 150));
    let statePicker = UIPickerView(frame: CGRect(x: 0, y: 50, width: 100, height: 150));
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        let inputAccessoryView = UIToolbar(frame:CGRect(x: 150, y: 50, width: 100, height: 40));
        let stateInputAccessoryView = UIToolbar(frame:CGRect(x: 150, y: 50, width: 100, height: 40));
        let ageInputAccessoryView = UIToolbar(frame:CGRect(x: 150, y: 50, width: 100, height: 40));
        let yearInputAccessoryView = UIToolbar(frame:CGRect(x: 150, y: 50, width: 100, height: 40));
        
        var flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil);
        
        var makeOfCarDone = UIBarButtonItem(title: "Done", style: .Plain, target: self, action:"ClickedMakeOfCarDone");
        var stateDone = UIBarButtonItem(title: "Done", style: .Plain, target: self, action:"ClickedStateDone");
        var ageDone = UIBarButtonItem(title: "Done", style: .Plain, target: self, action:"ClickedAgeDone");
        var yearDone = UIBarButtonItem(title: "Done", style: .Plain, target: self, action:"ClickedYearDone");

        
        inputAccessoryView.setItems([flexibleSpace,makeOfCarDone], animated: false);
        stateInputAccessoryView.setItems([flexibleSpace,stateDone], animated: false);
        ageInputAccessoryView.setItems([flexibleSpace,ageDone], animated: false);
        yearInputAccessoryView.setItems([flexibleSpace,yearDone], animated: false);
        
        carMakePicker.dataSource = self;
        carMakePicker.delegate = self;
        carMakePicker.showsSelectionIndicator = true;
        
        makeOfCar.inputAccessoryView = inputAccessoryView;
        makeOfCar.inputView = carMakePicker;
        
        statePicker.dataSource = self;
        statePicker.delegate = self;
        
        stateOfResidence.inputAccessoryView = stateInputAccessoryView;
        stateOfResidence.inputView = statePicker;
        
        ageOfDriver.inputAccessoryView = ageInputAccessoryView;
        ageOfDriver.delegate = self;
        
        yearOfManufacture.inputAccessoryView = yearInputAccessoryView;
        yearOfManufacture.delegate = self;
        
        
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
    
    func ClickedAgeDone()
    {
        ageOfDriver.resignFirstResponder();
    }
    
    func ClickedYearDone()
    {
        yearOfManufacture.resignFirstResponder();
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true);
        self.navigationController?.title = "QuickQuote";
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true);    }
    
//  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//     self.view.endEditing(true);
//  }
    
    
    func CalculateQuote()
    {
        var calculate = false;
        
        var age = ageOfDriver.text.toInt();
        var state = stateOfResidence.text;
        var make = makeOfCar.text;
        var year = yearOfManufacture.text.toInt();
        var gender = "Male";
        
        switch genderOfDriver.selectedSegmentIndex
        {
          case 0:
            gender = "Male";
            break;
            
        case 1:
            gender = "Female";
            break;
        
        default:
            break;
        }
        
        
        // Only perfom the calculation if the validation rules have been passed
        if (
            
            age > 0 &&
            state != "" &&
            make != "" &&
            year > 0
            
            )
        {
            var quote = CarQuote(age: age!,gender:gender,state: state ,make: make,year: year!);
            
            premium.text = CarPremiumCalculator().getPremiumForQuoteAsString(quote);
            premium.accessibilityLabel = premium.text;
            premium.hidden = false;
        }
        else
        {
            premium.text = "$00.00";
            premium.accessibilityLabel = premium.text;
            premium.hidden = true;
        }
        

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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
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

    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder();
        return true;
    }
  
}



