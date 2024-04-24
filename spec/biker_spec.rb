require "./lib/ride.rb"
require "./lib/biker.rb"

RSpec.describe Biker do
    before(:all) do 
        @biker1 = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@biker1).to be_an_instance_of (Biker)
        end

        it "can initialize wtih a name" do
            expect(@biker1.name).to eq('Kenny')
        end

        it "can initialize with a max distance" do
            expect(@biker1.max_distance).to eq(30)
        end

        it "can initialize with a rides" do
            expect(@biker1.rides).to eq({})
        end

        it "can initialize with a rides" do
            expect(@biker1.acceptable_terrain).to eq([])
        end
    end

    describe "#learn_terrain!" do
        it "can learn new terrain types" do
            expect(@biker1.acceptable_terrain).to eq([])

            @biker1.learn_terrain!(:gravel)

            expect(@biker1.acceptable_terrain).to eq([:gravel])

            @biker1.learn_terrain!(:hills)

            expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])

            @biker1.learn_terrain!(:gravel)

            expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])
        end

    end

    describe "#log_ride" do
    it "can log a ride" do
        expect(@biker1.rides).to eq({})

        @biker1.log_ride(@ride1, 92.5)
        expect(@biker1.rides).to eq ({@ride1 => 92.5})

        @biker1.log_ride(@ride1, 91.1)
        expect(@biker1.rides).to eq ({@ride1 => 92.5, @ride1 => 91.1})
        
        @biker1.log_ride(@ride2, 60.9)
        @biker1.log_ride(@ride2, 61.6)

        expect(@biker1.rides).to eq ({@ride1 => 92.5, @ride1 => 91.1, @ride2 => 60.9, @ride2 => 61.6})
    end

end

# pry(main)> biker.personal_record(ride1)
# => 91.1

# pry(main)> biker.personal_record(ride2)
# => 60.9

# pry(main)> biker2 = Biker.new("Athena", 15)
# => #<Biker:0x00007fc62cb399e0...>

# pry(main)> biker2.log_ride(ride1, 97.0) #biker2 doesn't know this terrain yet

# pry(main)> biker2.log_ride(ride2, 67.0) #biker2 doesn't know this terrain yet

# pry(main)> biker2.rides
# # => {}

# pry(main)> biker2.learn_terrain!(:gravel)

# pry(main)> biker2.learn_terrain!(:hills)

# pry(main)> biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance

# pry(main)> biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance

# pry(main)> biker2.rides
# #=> { #<Ride:0x00007fc62cb42ba8...> => [65.0] }

# pry(main)> biker2.personal_record(ride2)
# #=> 65.0

# pry(main)> biker2.personal_record(ride1)
# #=> false
# ```