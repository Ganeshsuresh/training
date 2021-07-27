require_relative '/home/ganeshh/git/trainning/page/login_page'
require_relative '/home/ganeshh/git/trainning/page/brand_listing_page.rb'

describe 'the signin process', type: :feature do
  it 'signs me in' do
    page = LoginPage.new
    page.load
    sleep 40
    page.signin('turneruser@turner.com', 'turnertest')
    expect(current_url).to eq("https://explorer.stage.lfmprod.in/#dashboard/start")
    page.select_menu_item('Brands')
    brand_listing_page = BrandListing.new
    brand_listing_page.brands_name.include?("Full Frontal with Samantha Bee")
    expect(brand_listing_page.displaying_count).to eq '6'
    expect(brand_listing_page.total_count_from_header).to eq '6'
    expect(brand_listing_page.total_count_from_rows).to eq (6)
    brand_listing_page.filter_by('Full Frontal with Samantha Bee')
    expect(brand_listing_page.displaying_count).to eq '1'
    expect(brand_listing_page.total_count_from_header).to eq '6'

    
    expect(brand_listing_page.total_count_from_rows).to eq (1)
    brand_listing_page.clear_filter
    table = brand_listing_page.table
    fan_growth_agg_value = brand_listing_page.aggregate_table.fan_growth_agg_value
    expect(table.sum_of_fan_growth_table_values).to eq(fan_growth_agg_value)
  end
end
