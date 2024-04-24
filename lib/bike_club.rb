require "./lib/ride.rb"
require "./lib/biker.rb"

class BikeClub
    attr_reader :name, 
                :bikers
                
    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_bikers(biker)
        @bikers << biker
    end

    def most_rides
        @bikers.max_by {|biker| biker.rides.length}
    end

    def best_time(ride)
        times = {}

        @bikers.each do |biker|
            if biker.rides.include?(ride)
                times.store(ride_time.store(biker.rides, biker.rides[ride]), biker)
                times.values.max
            end
    
        end
    end
end
