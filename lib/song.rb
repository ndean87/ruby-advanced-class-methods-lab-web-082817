require 'pry'


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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

  def self.new_by_name(song_name)
    self.new(song_name)
  end

  def self.create_by_name(song_name)
    new_song = self.new(song_name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |instance|
      if instance.name == song_name
        instance
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song_name|
      song_name.name
    end
  end

  def self.new_from_filename(full_file)
    no_mp3 = full_file.split('.')[0]
    artist = no_mp3.split('-')[0].strip
    song = no_mp3.split('-')[1].strip
    self.new(song, artist)
  end

  def self.create_from_filename(filename)
    add_a_file = self.new_from_filename(filename)
    @@all << add_a_file
  end

  def self.destroy_all
    self.all.clear
  end

end
