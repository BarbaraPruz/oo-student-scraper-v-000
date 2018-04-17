require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []

    Nokogiri::HTML(open(index_url)).css('.student-card').each { | student |
      students << {
        :name => student.css(".card-text-container h4").text,
        :location => student.css(".student-location").text,
        :profile_url => student.css("a").attribute("href").value,
      }
    }
    students
  end


  def self.scrape_profile_page(profile_url)
    attributes = []

    page = Nokogiri::HTML(open(index_url))
    binding.pry
    # page.css('.profile-quote')
    # page.css('.social-icon-container')
    # page.css('.description-holder p')
    attributes
  end

end
