require "./lib/ride.rb"
require "./lib/biker.rb"
require "./lib/bike_club.rb"

RSpec.describe BikeClub do
    before(:all) do 
        @bike_club = BikeClub.new("SLC Bikers")
        @biker1 = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@bike_club).to be_an_instance_of (BikeClub)
        end

        it "can initialize with a name" do
            expect(@bike_club.name).to eq('SLC Bikers')
        end

        it "can initialize with a list of bikers in club" do
            expect(@bike_club.bikers).to eq([])
        end
    end
end