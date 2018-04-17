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

  end

end

##
BASE_PATH = "./fixtures/student-site/"
slist = Scraper.scrape_index_page(BASE_PATH + 'index.html')
Student.create_from_collection(slist)
Student.all.each { | student | { puts "#{student.name} #{student.location} #{student.profile_url}"}
