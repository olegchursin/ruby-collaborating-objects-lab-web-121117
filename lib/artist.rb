require_relative 'song.rb'
require_relative 'mp3_importer.rb'
require 'pry'

class Artist

  attr_accessor :name, :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_name)
    @songs << song_name
  end

  def songs
    @songs
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      result = self.new(name)
      result.save
    end
  end

  def print_songs
    @songs.each { |song_instance| puts song_instance.name  }
  end


end
