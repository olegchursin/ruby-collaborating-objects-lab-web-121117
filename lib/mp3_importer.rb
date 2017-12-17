require 'pry'
require_relative 'artist.rb'
require_relative 'song.rb'


class MP3Importer

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    all_files = Dir.entries(path)
    normalized_files = all_files.select {|file| file.include?".mp3"}
    normalized_files
    #binding.pry
  end

  def import
    self.files.each { |filename| Song.new_by_filename(filename) }
  end

end
