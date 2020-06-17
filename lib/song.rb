class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []
  @@name
  @@artist_name
  
  def self.create
    song = self.new.save 
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    self.new_by_name(name).save
  end
  
  def self.find_by_name(name)
     self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    songs = self.all.sort_by { |song| song.name}
    songs
  end
  
  def self.new_from_filename(filename)
    song = self.new
    @filename = filename
    song.artist_name, song.name = @filename.delete_suffix(".mp3").split(" - ")
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end
  
  
  
  
 
end
