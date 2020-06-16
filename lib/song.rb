class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.create
    song = self.new
    self.all << song
    @@all[0]
    song
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
    title = self.new
    title.name = name
    title
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    song = self.all.detect {|s| s.name == name} 
    song
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end

  def self.create_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end

  def self.destroy_all
    self.all.clear
  end

end
