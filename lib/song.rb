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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song)
    @@all.detect {|x| x.name == song}
  end


  def self.find_or_create_by_name(song)
    song_entry = nil
    song_entry = self.find_by_name(song)
    if song_entry == nil
      self.create_by_name(song)
     else
      song_entry
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    new_name = nil
    name_array = []
    new_name = name.delete_suffix(".mp3")
    name_array = new_name.split(' - ')
    artist = name_array[0]
    song = name_array[1]

    listing = self.new
    listing.name = song
    listing.artist_name = artist
    listing
  end

  def self.create_from_filename(name)
    new_name = nil
    name_array = []
    new_name = name.delete_suffix(".mp3")
    name_array = new_name.split(' - ')
    artist = name_array[0]
    song = name_array[1]

    listing = self.create
    listing.name = song
    listing.artist_name = artist

  end



  def self.destroy_all
    self.all.clear
  end


end
