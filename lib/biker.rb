class Biker
attr_reader :name, :max_distance, :rides, :acceptable_terrains, :total_rides

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrains = []
        @total_rides = 0
    end

    def learn_terrain(terrain)
        @acceptable_terrains << terrain unless @acceptable_terrains.include?(terrain)
    end

    def log_ride(ride, time)
        return unless @acceptable_terrains.include?(ride.terrain) && 
        ride.distance <= @max_distance

        @rides[ride] ||= []
        @rides[ride] << time
        @total_rides += 1
    end

    def personal_record(ride)
        times = @rides[ride]
        return false unless times

        times.min
    end
end