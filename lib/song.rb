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
    song = self.new #instantiates a new song
    song.save #saves the song
    song #returns the new song that was created
  end 

  def self.new_by_name(name) #name property
    song = self.new #instantiates a new song 
    song.name = name # with a name property
    song #returns the new song with name property created 
  end 

  def self.create_by_name(name)
    song = self.new #instantiates a new song
    song.name = name #with a name property
    song.save #saves the song with name property
    song #returns the new song with name property created
  end 

  def self.find_by_name(name) 
    @@all.detect{|song| song.name == name} #can find a song present in @@all by name {returns falsey when a song name is not present in @@all}
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)#invokes .find_by_name and .create_by_name instead of repeating code
  end 

  def self.alphabetical 
    @@all.sort_by{|song| song.name } #returns all the song instances in alpha order by song name
  end 

  def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ") # method variable = to remove .mp3 format
    song = Song.new #creates new song and artist name with filename format
    song.name = split_filename[1] # will remove filename format from song title
    song.artist_name = split_filename[0] # will remove ( "- ") from Artist name
    song.save # save new song and artist format
    song #returns new filename
  end 

  def self.create_from_filename(name)
    song = Song.new #initializes a new song & artist_name
    song.name = (name.split(" - ")[1].chomp(".mp3")) # removes any characters from song and filename format
    song.artist_name = (name.split(" - ")[0]) # removes any characters from artist_name
    @@all << song # add new formated filename into the @@all class variable
    song #returns new added song and artist name
  end

  def self.destroy_all 
    self.all.clear # clears all the song instances from the @@all array 
  end 
end
