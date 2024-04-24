class Ride
    attr_reader :name, 
                :distance, 
                :loop, 
                :terrain

    def initialize(params)
        @name = params[:name]
        @distance = params[:distance]
        @loop = params[:loop]
        @terrain = params[:terrain]
    end

    def total_distance
        if @loop
            actual_distance = @distance
        else 
            actual_distance = @distance * 2 
        end
        actual_distance
    end
end