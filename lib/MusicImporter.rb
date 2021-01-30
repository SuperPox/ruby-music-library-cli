require 'pry'
class MusicImporter
    attr_accessor :path
    
    def initialize(path) #path = Dir.entries("./spec/fixtures/mp3s")
        @path = path
    end

    def files 
        filename = Dir.entries(@path)
        filename = filename.delete_if{|i| i == ".." || i == "."}
        filename
    end

    def import
        files.each do |i|
            Song.create_from_filename(i)
        end
    end

end