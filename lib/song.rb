require 'pry'
class Song
  attr_accessor :name, :artist_name, :song 
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    @@all << song 
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
    @@all << song 
    song 
  end

  def self.find_by_name(name)
    @@all.find { |song_name| song_name.name == name}
  end 

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end 
  end 

  def self.alphabetical
      self.all.sort_by { |song| song.name}.uniq 
  end 

  def self.new_from_filename(csv)
    song_array = csv.chomp('.mp3').split(' - ')
    song = self.create 
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song 
  end 

  def self.create_from_filename(csv)
    song = new_from_filename(csv)
    @@all << song 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 

end
