require_relative '../.././page/login_page.rb'
require_relative '../.././page/brand_listing.rb'

describe 'BrandListing page Should have an Expected Brand', case: 'ex_02', type: :feature do
  it 'BrandListing page Should have an Expected Brand' do
    page = Config.new
    page.load
    sleep 40
    page.signin
    page.select_menu_item('Brands')
    brand_listing_page = BrandListing.new
    brand_listing_page.brands_name.include?("Full Frontal with Samantha Bee")
  end
end
