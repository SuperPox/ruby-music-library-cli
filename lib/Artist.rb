require 'pry'
class Artist
    extend Findable::ClassMethods 
    include Findable::InstanceMethods

    attr_accessor :name, :artist, :genre
    @@all = []
    @songs = []
    @genres = []


    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def self.create(name)
        var = self.new(name)
        var.save
        var
    end

    def songs
        @songs
    end

    def genres
        arr = []
        self.songs.select do |songInstance|
            if songInstance.artist == self
                arr << songInstance.genre # self.songs[1].genre.name
            end
        end
        return arr.uniq
    end

    def add_song(song)
        if song.artist == self
            if @songs.include?(song)
                return
            else
                @songs << song
            end
        else
            song.artist = self
            if @songs.include?(song)
                return
            else
                @songs << song
            end
        end
    end
end