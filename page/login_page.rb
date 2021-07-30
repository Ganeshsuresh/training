class LoginPage < SitePrism::Page
  set_url 'https://explorer.stage.lfmprod.in/#dashboard/start'

  element :username_field, "input[name='username']"
  element :password_field, "input[name='password']"
  element :flash, 'div.flash'
  element :login_button, 'input.btn.btn-primary.submitButton-customizable'
  element :item_label, '.item-label'

  def signin_with(username, password)
    username_field.set(username)
    password_field.set(password)
    login_button.click
    sleep 20
  end

  def select_menu_item(name)
    items = all(".item-label").find{|label| label.text == name}
    items.click
  end
end
