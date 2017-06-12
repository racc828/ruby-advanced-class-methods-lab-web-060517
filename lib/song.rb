
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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.save
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.all.include?(song_name)
      return song_name
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(file)
    split_file = file.split(" - ")
    artist_name = split_file[0]
    song_name = split_file[1].chomp(".mp3")
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(file)
    split_file = file.split(" - ")
    artist_name = split_file[0]
    song_name = split_file[1].chomp(".mp3")
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end


  def self.destroy_all
    @@all.clear
  end

end
