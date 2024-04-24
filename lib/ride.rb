class Ride
    attr_reader :name, 
                :distance, 
                :loop, 
                :terrain,
                :total_distance

    def initialize(params)
        @name = params[:name]
        @distance = params[:distance]
        @loop = params[:loop]
        @terrain = params[:terrain]
        @total_distance = total_distance
    end

    def total_distance
        if !@loop
            total = @distance + @distance
        else
            total = @distance
        end
        total
    end
end