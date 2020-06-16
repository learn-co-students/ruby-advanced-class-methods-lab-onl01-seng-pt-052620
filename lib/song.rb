class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.create
    @@all << self.new
    @@all[0]
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(song_name)
    self.new.name = song_name
    self.new
  end
  
  def self.create_by_name
    
  end

end
