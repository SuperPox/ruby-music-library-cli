module Findable
    module ClassMethods
        def destroy_all
            self.all.clear
        end    
        def find_by_name(name)
            self.all.detect{|o| o.name == name}
        end
        def find_or_create_by_name(name)
            if var = find_by_name(name)
                var 
            else
                self.create(name)
            end
        end
    end
    module InstanceMethods
        def save
            self.class.all << self
        end
    end
end


# self.songs.select do |songInstance|
#     if songInstance.artist == self
#         arr << songInstance.genre # self.songs[1].genre.name
#     end
# end
# return arr.uniq