require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@all_names = []
  @@alpha = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    match = self.find_by_name(name)
    creation = self.create_by_name(name)
    if match
      match
    else
      creation
    end
    # self.create_by_name(name) unless match
    #
    # # @name = name
    # if @@all.find_by_name(name) == name
    #   @@all.find_by_name(name)
    #   # self
    # else
    #
    # end
  end

  def self.alphabetical
    @@all.each do |instance|
          # binding.pry
      @@all_names << instance.name
    end

    sorted_names = @@all_names.sort_by { |a, b| a <=> b }
    @@all_names.each do |name|
      @@alpha << @@all.find_by_name(name)
    end
    @@alpha
  end

  def self.new_from_filename(filename)
    filename = filename.sub(/.mp3/, "")
    split = filename.split(" - ")
    name = split[1]
    artist_name = split[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end

s = Song.create_by_name("Mandy")
t = Song.create_by_name("Copa")
puts "hello"
puts s.name
