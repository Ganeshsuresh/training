require "selenium-webdriver"

describe 'Try login into gmail using only selenium-webdriver', type: :feature do
  it 'Try login into gmail using only selenium-webdriver', case: 'ex_06' do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLoginn'
    element = driver.find_element(:id, 'identifierId')
    element.send_keys 'ganesh@drylogics.com'
    next_element = driver.find_element(:class, 'VfPpkd-vQzf8d')
    next_element.click
    sleep 3
    password_element = driver.find_element(:name, 'password')
    password_element.send_keys 'Suresh@3'
    button_element = driver.find_element(:class, 'VfPpkd-vQzf8d')
    button_element.click
  end

  it 'Try login into explorer and navigate to brand list using only selenium-webdriver', case: 'ex_06_p1' do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://explorer.stage.lfmprod.in/#dashboard/start'
    sleep 15
    element = driver.find_element(:name, 'username')
    element.send_keys 'ganesh@drylogics.com'
    password_element = driver.find_element(:name, 'password')
    password_element.send_keys 'Drylogics@123'
    button_element = driver.find_element(:name, 'signInSubmitButton')
    button_element.click
    sleep 30
    brand_menu = driver.find_element(:class, 'brands')
    brand_menu.click
  end
end
