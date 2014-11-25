
quickquote = Quickquoteios.new

Given(/^I want a car insurance quote$/) do
	invoke(quickquote.btnGetACarQuote)
end


When(/^I submit my  details '(\d+)', '(.*?)', '(.*?)', '(.*?)' & '(.*?)' for a car insurance quote$/) do | age, gender, state, year, make |
  


  # Select the make of car
  #TODO: fix invoke
  
  
  invoke(quickquote.txtCarMake)
  # find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIATextField[1]").click
  setValue(quickquote.pikCarMake,make)
  invoke(quickquote.btnDone)

# select the state
  bob = {:type => "text", :xpath => "//UIAApplication[1]/UIAWindow[1]/UIATextField[4]"}
  invoke(bob)
 
 # type = bob.delete(:type)
 # find_element(bob).click
 # bob[:type] = type
  
  setValue(quickquote.pikState,state)
  invoke(quickquote.btnDone)


  #setValue(quickquote.State,state)
  # setValue(quickquote.txtEmail,"test@example.com")

  invoke(quickquote.btnGetQuote)
  invoke(quickquote.btnBack)


end

Then(/^I should see the correct '(.*)' shown$/) do | premium |
 
 #puts getValue(quickquote.Price)
  price = getValue(quickquote.txtPrice)
  raise unless price == premium
end
