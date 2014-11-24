class Quickquoteios

  attr_accessor :GetACarQuote,:GetALifeQuote,:Back, :GetQuote, :Year, :Age, :Email, :Price, :CarMake, :State

  def initialize
    
    
    # Controls
    @GetACarQuote = {:type => "button", :name => "Get a car quote" }
    @GetALifeQuote = {:type => "button", :name => "Get a car quote" }
    @Back = {:type => "button", :name => "Back" }

    @GetQuote = {:type => "button", :name => "Get Quote" }

    @Year = {:type => "text+tap", :name => "Year" }
    @Age = {:type => "text", :name => "Age" }
    @Email = {:type => "text", :name => "Email" }
    @Price = {:type => "text", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAStaticText[1]" }
    @CarMake = {:type => "uipicker", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAPicker[1]/UIAPickerWheel[1]" }
    @State = {:type => "uipicker", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIAPicker[2]/UIAPickerWheel[1]" }

  end
 
 
end