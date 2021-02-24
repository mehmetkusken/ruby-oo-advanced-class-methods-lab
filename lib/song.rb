class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
  def self.new_by_name (name)
  song = Song.new
    song.name = name
     song
end
def self.create_by_name (name)
  song = Song.create
  song.name = name
  song
end
def self.find_by_name (name)
  @@all.find{|song| song.name == name}
end
def self.find_or_create_by_name (name)
  self.find_by_name(name) || self.create_by_name(name)
end
def self.alphabetical
  @@all.sort_by {|song| song.name}
end
def self.new_from_filename (filename)
song_parts = filename.split(".")[0].split(" - ")
song_name = song_parts[-1]
artist_name = song_parts[0]
new_song = Song.new
new_song.name = song_name
new_song.artist_name = artist_name
new_song
end
def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
  song
end

  def self.create
    @@all << self.new
     @@all[-1]
  end
  def save
    self.class.all << self
    self
  end
  def self.destroy_all
    @@all.clear
  end
end