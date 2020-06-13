require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song_name = Song.new
    song_name.save 
    song_name 
  end

  def self.new_by_name(name)
    song_name = Song.new 
    song_name.name = name  
    song_name 
  end 

  def self.create_by_name(name)
    song_name = Song.create 
    song_name.name = name  
    song_name 
  end 

  def self.find_by_name(title)
    @@all.find do|song_name|
    song_name.name == title 
    end 
  end
  
  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else  
      self.find_by_name(title)   
    end 
  end   
    
  
  def self.alphabetical
    @@all.sort_by do |title| 
      title.name 
    end  
  end 

  def self.new_from_filename(name)
  
  name.chomp!(".mp3")
  data = name.split(" - ")
  artist_name = data[0] 
  name = data[1]
  
  new_song = Song.new 
  new_song.artist_name = artist_name 
  new_song.name = name 
  new_song 
  end 

  def self.create_from_filename(name)
  
    name.chomp!(".mp3")
    data = name.split(" - ")
    artist_name = data[0] 
    name = data[1]
    
    new_song = Song.create  
    new_song.artist_name = artist_name 
    new_song.name = name 
    new_song 
    end 

    def self.destroy_all
      @@all.clear  
    end 
    
end

