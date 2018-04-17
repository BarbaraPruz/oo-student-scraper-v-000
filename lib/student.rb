require_relative "../lib/scraper.rb"

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @profile_url = student_hash[:profile_url]
    @@all < self
  end

  def self.create_from_collection(students_array)
    students_array.each { | student_hash | new(student_hash)}
  end

  def add_student_attributes(attributes_hash)

  end

  def self.all
    @@all
  end
end

##
BASE_PATH = "./fixtures/student-site/"
slist = Scraper.scrape_index_page(BASE_PATH + 'index.html')
Student.create_from_collection(slist)
Student.all.each { | s | puts "#{s.name} #{s.location} #{s.profile_url}"}
