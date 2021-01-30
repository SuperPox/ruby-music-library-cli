require 'pry'

class Song
    extend Concerns::Findable 
    include Concerns::InstanceMethods
    
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artistObject = nil, genreObject = nil)
        @name = name
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.new_from_filename(filename) 
        temp = filename.split(' - ')
        artist = temp[0] 
        artistchecked = Artist.find_or_create_by_name(artist) 
        title = temp[1] 
        genre = temp[2].gsub('.mp3','') 
        genrechecked = Genre.find_or_create_by_name(genre) 
        self.new(title, artistchecked, genrechecked)
    end

    def self.create_from_filename(filename)
        temp = self.new_from_filename(filename)
        @@all << temp
    end
end

