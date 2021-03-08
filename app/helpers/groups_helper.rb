module GroupsHelper
  def icons
    html_data = RestClient.get('https://www.flaticon.com/packs/web-design-122?word=code')
    nok_obj = Nokogiri::HTML(html_data)
    tags = nok_obj.xpath('//html/body/section/div/div/section/ul/li')
    i_hash = {}
    tags.each_with_index do |li, i|
      i_hash[i] = {
        'name' => li['data-name'],
        'link' => li['data-icon_src'],
        'auth' => li['data-author_name']
      }
    end
    i_hash
  end
end
