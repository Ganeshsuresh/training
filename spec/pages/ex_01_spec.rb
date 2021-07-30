require_relative '../.././page/login_page.rb'
require_relative '../.././page/brand_listing.rb'

describe 'the signin process', case: 'ex_01', type: :feature do
  it 'the signin process' do
    page = LoginPage.new
    page.load
    sleep 40
    page.signin('turneruser@turner.com', 'turnertest')
    expect(current_url).to eq("https://explorer.stage.lfmprod.in/#dashboard/start")
  end
end
