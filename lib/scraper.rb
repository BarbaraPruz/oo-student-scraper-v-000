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
    attributes = {}
puts "scrape profile #{profile_url}"
    page = Nokogiri::HTML(open(profile_url))
    attributes[:profile] = page.css(".profile-quote").text
    attributes[:bio] = page.css(".description-holder p").text
    page.css(".social-icon-container a").each {| anchor |
      url = anchor.attribute("href").text
          binding.pry
        }
    # page.css('.social-icon-container')

    attributes
  end

end
