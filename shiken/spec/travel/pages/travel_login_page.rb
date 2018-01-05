require_relative "travel_base_page.rb"

class TravelLoginPage < TravelBasePage
    
  def initialize()
    super('login') 
  end
  
  def username
    WT::Field.new({ id: 'username' })
  end
  def password
    WT::Field.new({ id: 'password' })
  end
  def login_button
    WT::Button.new({ type: "submit" })
  end
  
  def fill_and_submit(user=$good_user, pass=$good_pass)
  	username.set(user)
  	password.set(pass)
    login_button.click(2)
  end
  
end

$TravelLoginPage = TravelLoginPage.new()