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
            elsif input == 'list artist'
                self.list_songs_by_artist
            elsif input == "list artists"
                self.list_artists
            elsif input == 'list genres'
                self.list_songs_by_genre
            elsif input == 'list genre'
                self.list_songs_by_genre
            elsif input == 'play song'
                self.play_song #fake play right???????????
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

    def list_artists
        Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
          puts "#{i}. #{a.name}"
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
        user = gets #.strip    
        if Artist.all.each {|i| i.name == user}
            self.list_songs
        else
            puts "Please enter the name of an artist:"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user = gets
        if Genre.all.each {|i| i.name == user}
            self.list_genres
         else
            puts "Please enter the name of a genre:"
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        list_songs
        selection = gets.chomp.to_i
        sortedSongs = Song.all.sort_by { |i| i.name }
        if selection > 0 && selection < sortedSongs.length + 1
            choice = sortedSongs[selection - 1]
            puts "Playing #{choice.name} by #{choice.artist}"
        end
    end
end


