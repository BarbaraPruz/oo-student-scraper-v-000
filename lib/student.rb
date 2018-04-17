require_relative "../lib/scraper.rb"

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @profile_url = student_hash[:profile_url]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each { | student_hash | new(student_hash)}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each { |key, value| instance_variable_set("@#{key}", value) }
    # attributes_hash.each do | key, val |
    #   case key
    #   when :bio
    #       @bio = val
    #     when :profile_quote
    #       @profile_quote = val
    #     when :blog
    #       @blog = val
    #     when :github
    #       @github = val
    #     when :linkedin
    #       @linkedin = val
    #     when :twitter
    #       @twitter = val
    #   end
    # end
  end

  def self.all
    @@all
  end
end
