require_relative '/home/ganeshh/git/training/page/login_page.rb'
class Config < LoginPage
  set_url 'https://explorer.stage.lfmprod.in/#dashboard/start'

  def signin
    signin_with('turneruser@turner.com', 'turnertest')
  end
end
