class Quickquoteios

attr_accessor :btnGetACarQuote,:btnGetALifeQuote, :btnBack, :btnGetQuote, :txtYear, :txtAge, :txtEmail,:btnMale, :btnFemale, :txtPrice, :txtCarMake, :neil, :pikCarMake, :txtState, :pikState,:btnDone

  def initialize
    
    
    # Controls
    @btnGetACarQuote = {:type => "button", :name => "Get a car quote" }
    @btnGetALifeQuote = {:type => "button", :name => "Get a car quote" }
    @btnBack = {:type => "button", :name => "Back" }

    @btnGetQuote = {:type => "button", :name => "Get Quote" }

    @txtYear = {:type => "text", :name => "Year" }
    @txtAge = {:type => "text", :name => "Age" }
    @txtEmail = {:type => "text", :name => "Email" }
    @btnMale = {:type => "button", :name => "Male" }
    @btnFemale = {:type => "button", :name => "Female" }
    
    @txtPrice = {:type => "text", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAStaticText[1]" }
   
   
    @txtCarMake = {:type => "text", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIATextField[1]"}
   
    @pikCarMake = {:type => "uipicker", :xpath => "//UIAApplication[1]/UIAWindow[2]/UIAPicker[1]/UIAPickerWheel[1]" }
  
    @txtState = {:type => "text", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIATextField[4]"}
    @pikState = {:type => "uipicker", :xpath => "//UIAApplication[1]/UIAWindow[2]/UIAPicker[1]/UIAPickerWheel[1]" }
  
  
    @btnDone = {:type => "button", :name => "Done" }

  end
 
 
end