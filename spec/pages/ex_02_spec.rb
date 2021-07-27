require_relative '/home/ganeshh/git/trainning/page/login_page'
require_relative '/home/ganeshh/git/trainning/page/brand_listing_page.rb'

describe 'BrandListing page Should have an Expected Brand', case: 'ex_02', type: :feature do
  it 'BrandListing page Should have an Expected Brand' do
    page = LoginPage.new
    page.load
    sleep 40
    page.signin('turneruser@turner.com', 'turnertest')
    page.select_menu_item('Brands')
    brand_listing_page = BrandListing.new
    brand_listing_page.brands_name.include?("Full Frontal with Samantha Bee")
  end
end
