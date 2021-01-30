require 'pry'
class MusicLibraryController
    attr_accessor :path

    def initialize(path = './db/mp3s')
        @path = path
        temp = MusicImporter.new(@path)
        temp.import
    end

    def call
        puts "Welcome to your music library!"
        puts ("To list all of your songs, enter 'list songs'.")
        puts ("To list all of the artists in your library, enter 'list artists'.")
        puts ("To list all of the genres in your library, enter 'list genres'.")
        puts ("To list all of the songs by a particular artist, enter 'list artist'.")
        puts ("To list all of the songs of a particular genre, enter 'list genre'.")
        puts ("To play a song, enter 'play song'.")
        puts ("To quit, type 'exit'.")
        puts ("What would you like to do?")
        input = ""
        while input != "exit"
            input = gets.strip 
            if input == 'list songs'
                self.list_songs
            elsif input == 'list artists'
                self.list_artists
            elsif input == 'list genres'
                self.list_genres
            elsif input == 'play song'
                self.list_songs #fake play right???????????
            elsif input == 'secret'
                puts "yey you found the secret!"
            end
        end
    end

    def list_songs #
        arr = Song.all.sort {|i, x| i.name <=> x.name}
        arr.each_with_index do |i, index| 
            puts "#{index+1}. #{i.artist.name} - #{i.name} - #{i.genre.name}" 
        end
    end

    #prints all artists in the music library in a numbered list (alphabetized by artist name)
    def list_artists 
        arr = Artist.all.sort {|i, x| i.name <=> x.name}
        #binding.pry
        arr.each_with_index do |i, index| 
            puts "#{index+1}. #{i.name}" 
        end
    end

    def list_genres
        arr = Genre.all.sort {|i, x| i.name <=> x.name }

        arr.each_with_index do |i, index| 
            puts "#{index+1}. #{i.name}" 
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        Artist.songs
    end

    def list_songs_by_genre
        puts "what genre sucka?"
        Genre.songs
    end

    def play_song
        puts "pick a number"
    end
end


