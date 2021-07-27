require_relative '/home/ganeshh/git/trainning/page/login_page'
require_relative '/home/ganeshh/git/trainning/page/brand_listing_page.rb'

describe 'the signin process', case: 'ex_01', type: :feature do
  it 'signs me in' do
    page = LoginPage.new
    page.load
    sleep 40
    page.signin('turneruser@turner.com', 'turnertest')
    expect(current_url).to eq("https://explorer.stage.lfmprod.in/#dashboard/start")
  end
end
