class BrandListing < SitePrism::Page
  set_url 'https://explorer.stage.lfmprod.in/#explore/favorites/brands'

  element :brands, '.title-span'
  elements :rows, 'tr.even, tr.odd'
  element :filter, '#brandsdatatable_filter input'
  section :aggregate_table, 'table#brandsdatatable tfoot tr' do
    elements :aggregate_functions, 'div.aggregate-functions span'

    def fan_growth_agg_value
      find('th.public_fan_acquisition_score div.brand-metrics')['data-sortvalue'].to_i
    end

    def click_button(name)
      button = aggregate_functions.find { |span| span.text == name }
      button.click
    end
  end

  section :table, 'table#brandsdatatable' do
    element :footer, 'tfoot'
    elements :fan_growth_table_values, 'tbody [data-datapoint="lfm.audience_ratings.public_fan_acquisition_score"]'

    def sum_of_fan_growth_table_values
      fan_growth_table_values.map { |value| value['title'].delete(',').to_i }.sum
    end
  end

  def brands_name
    all('.title-span').map(&:text)
  end

  def select_brand(name)
    item = all('.title-span').find { |label| label.text == name }
    item.click
  end

  def displaying_count
    header = find('div.dataTables_info').text
    header.gsub(/SHOWING (\d+) OF (\d+) BRANDS/, '\1')
  end

  def total_count_from_header
    header = find('div.dataTables_info').text
    header.gsub(/SHOWING (\d+) OF (\d+) BRANDS/, '\2')
  end

  def total_count_from_rows
    rows.count
  end

  def filter_by(name)
    filter.set(name)
  end

  def clear_filter
    filter.set(nil)
  end
end
