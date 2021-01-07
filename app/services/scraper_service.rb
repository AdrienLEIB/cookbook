require 'open-uri'

class ScraperService
  def initialize(query)
    @query = query
  end

  def call
    figurines = []
    url = "https://www.shin-sekai.fr/search?controller=search&s=#{@query}"
    #url = "https://www.youtube.com/results?search_query=#{@query}"
    html = open(url).read
    doc = Nokogiri::HTML(html, nil, "utf-8")
    #rails
    doc.search(".product-description").first(10).each do |result|
      title = result.search("a").text.strip
      #desc = result.search(".recipe-card__description").text.strip
      figurines << {title: title}
    end
    return figurines

  end
end