
quickquote = Quickquoteios.new

Given(/^I want a car insurance quote$/) do
	invoke(quickquote.GetACarQuote)
end


When(/^I submit my  details '(\d+)', '(.*?)', '(.*?)', '(.*?)' & '(.*?)' for a car insurance quote$/) do | age, gender, state, year, make |
  
  #setValue(quickquote.CarMake,make)
  setValue(quickquote.Age,age +"\n")

  setValue(quickquote.Year,year)
  #setValue(quickquote.State,state)
  setValue(quickquote.Email,"test@example.com")

  invoke(quickquote.GetQuote)
  invoke(quickquote.Back)


end

Then(/^I should see the correct '(.*)' shown$/) do | premium |
 
 #puts getValue(quickquote.Price)
  price = getValue(quickquote.Price)
  raise unless price == premium
end
