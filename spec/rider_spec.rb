require './lib/ride'
require './lib/biker'
require 'pry'

describe 'Biker' do
    let(:ride1) {Ride.new({ name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills })}
    let(:ride2) {Ride.new({ name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel })}
    let(:biker1) {Biker.new("Kenny", 30)}
    let(:biker2) {Biker.new("Athena", 15)}

    describe '#initialization' do
        it 'should initialize' do
            expect(biker1.name).to eq("Kenny")
            expect(biker2.name).to eq("Athena")
            expect(biker1.max_distance).to eq(30)
            expect(biker2.max_distance).to eq(15)
            expect(biker1.rides).to eq({})
            expect(biker2.rides).to eq({})
            expect(biker1.acceptable_terrains).to eq([])
            expect(biker2.acceptable_terrains).to eq([])
        end
    end

    describe 'learn_terrain' do
        it "adds the terrain to the biker's list of acceptable terrains" do
            biker1.learn_terrain(:hills)
            expect(biker1.acceptable_terrains).to eq([:hills])
            biker1.learn_terrain(:gravel)
            expect(biker1.acceptable_terrains).to eq([:hills, :gravel])
        end

        it "doesn't add the same terrain twice" do
            biker1.learn_terrain(:hills)
            biker1.learn_terrain(:hills)
            expect(biker1.acceptable_terrains).to eq([:hills])
        end
    end

    describe 'logging the ride' do
        it 'can log a ride' do
            biker1.learn_terrain(:gravel)
            biker1.learn_terrain(:hills)

            biker1.log_ride(ride1, 92.5)
            biker1.log_ride(ride1, 91.1)
            biker1.log_ride(ride2, 60.9)
            biker1.log_ride(ride2, 61.6)

            expect(biker1.rides).to eq({ 
                ride1 => [92.5, 91.1],
                ride2 => [60.9, 61.6]
        })
        end

        it 'does not log a ride if the terrain is not acceptable' do
            biker1.learn_terrain(:gravel)
            biker1.log_ride(ride1, 92.5)

            expect(biker1.rides).to eq({})
        end

        it 'does not log a ride if the distance is too long' do
            biker3 = Biker.new("Kenny", 10)
            biker3.learn_terrain(:hills)
            biker3.log_ride(ride1, 92.5)

            expect(biker3.rides).to eq({})
        end
    end

end