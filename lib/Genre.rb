class Genre
    extend Findable::ClassMethods 
    include Findable::InstanceMethods

    attr_accessor :name
    @@all = []
    @songs = []
    

    def initialize(name)
        @name = name
        @@all << self
        @songs = []      
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def self.create(name)
        var = self.new(name)
        var.save
        var
    end

    def artists
        arr = []
        self.songs.select do |songInstance|
            if songInstance.genre == self
                arr << songInstance.artist # self.songs[1].genre.name
            end
        end
        return arr.uniq
    end

    def add_song(song)
        if song.genre == self
            if @songs.include?(song)
                return
            else
                @songs << song
            end
        else
            song.genre = self
            if @songs.include?(song)
                return
            else
                @songs << song
            end
        end
    end
end