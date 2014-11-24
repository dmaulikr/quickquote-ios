require 'selenium-webdriver'
require 'rubygems'
require 'appium_lib'

    server_url = "http://0.0.0.0:4723/wd/hub"

    capabilities = {
      'appium-version' => '1.0',
      'platformName' => 'iOS',
      'platformVersion' => '8.1',
      'deviceName' => 'iPhone 6'
    }
    
    @tester = Appium::Driver.new(caps: capabilities).start_driver
    Appium.promote_appium_methods Object
  
  def setValue(control, value)
    type = control.delete(:type)
    control[:type] = type
   # puts "The control type is: " + type
   # puts "Setting the value to: " + value
    element = @tester.find_element control
    
    case type
      
      when "uipicker" then
        element.send_keys value

         
      # Text boxes
      when "text" then
        element.send_keys value
        hide_keyboard( "Return" )

      when "text+tap" then
        element.send_keys value
        hide_keyboard
       #element.set_value value

       #element.set_value value
      else
        puts 'WARNING: Control type not defined.'
      
    end
  end
  
  def invoke(control)
    type = control.delete(:type)
    
    # need to support button, submit, link, image, radiobutton
    element = @tester.find_element control
    element.click
  end
  
  def getValue(control)
    type = control.delete(:type)
    element = @tester.find_element control

   # puts "The returned value is " + element.text

    element.text
    
  end
  
  def close()

    @tester.quit
  end


class ChorizoMobile

  
end