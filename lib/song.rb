require_relative 'song.rb'
require_relative 'mp3_importer.rb'
require "pry"

class Song

  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name.name)
    self.artist.add_song(self)
  end

  def self.new_by_filename(filename)
    file_info = filename.split(" - ")
    song = file_info[1]
    artist = file_info[0]
    new_song = Song.new(song)
    new_song.artist_name = Artist.new(artist)
    #binding.pry
    new_song
  end

end
