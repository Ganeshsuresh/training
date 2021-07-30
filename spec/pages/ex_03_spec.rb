require_relative '../.././page/login_page.rb'
require_relative '../.././page/brand_listing.rb'

describe 'Header shows the correct result', case: 'ex_03', type: :feature do
  it 'Header shows the correct result' do
    page = Config.new
    page.load
    sleep 40
    page.signin
    page.select_menu_item('Brands')
    brand_listing_page = BrandListing.new
    brand_listing_page.brands_name.include?('Full Frontal with Samantha Bee')
    expect(brand_listing_page.displaying_count).to eq '6'
    expect(brand_listing_page.total_count_from_header).to eq '6'
    expect(brand_listing_page.total_count_from_rows).to eq(6)
    brand_listing_page.filter_by('Full Frontal with Samantha Bee')
    expect(brand_listing_page.displaying_count).to eq '1'
    expect(brand_listing_page.total_count_from_header).to eq '6'
    expect(brand_listing_page.total_count_from_rows).to eq(1)
    brand_listing_page.clear_filter
  end
end
