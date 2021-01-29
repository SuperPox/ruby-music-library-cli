require 'pry'

class Song
    extend Findable::ClassMethods 
    include Findable::InstanceMethods
    
    attr_accessor :name, :artist, :genre
    @@all = []
    #@songs = []

    def initialize(name, artistObject = nil, genreObject = nil)
        @name = name
        #@songs = []
        if artistObject != nil
            @artist = artistObject
            self.artist=(artistObject)
        end
        if genreObject != nil
            @genre = genreObject
            self.genre = genreObject      
        end
    end

    def self.all
        @@all
    end

    def self.create(name)
        var = self.new(name)
        var.save
        var
    end

    # def songs
    #     @songs
    # end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end
end

