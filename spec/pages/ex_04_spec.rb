require_relative '../.././page/login_page.rb'
require_relative '../.././page/brand_listing.rb'

describe 'The sum of fan_growth_agg_value should equal the sum of the fan_growth on the table value', case: 'ex_04', type: :feature do
  it 'The sum of fan_growth_agg_value should equal the sum of the fan_growth on the table value' do
    page = LoginPage.new
    page.load
    sleep 40
    page.signin('turneruser@turner.com', 'turnertest')
    page.select_menu_item('Brands')
    brand_listing_page = BrandListing.new
    table = brand_listing_page.table
    fan_growth_agg_value = brand_listing_page.aggregate_table.fan_growth_agg_value
    expect(table.sum_of_fan_growth_table_values).to eq(fan_growth_agg_value)
  end
end
