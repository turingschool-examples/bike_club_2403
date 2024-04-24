require './lib/ride'

describe Ride do
    describe 'initialization' do
        it 'can create a ride' do
            ride = Ride.new({name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills})
            expect(ride.name).to eq('Walnut Creek Trail')
            expect(ride.distance).to eq(10.7)
            expect(ride.loop).to eq(false)
            expect(ride.terrain).to eq(:hills)
        end
    end

    describe 'loops' do
        it 'can determine if a ride is a loop' do
            ride1 = Ride.new({name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            expect(ride1.loop?).to eq(false)
            expect(ride2.loop?).to eq(true)
        end
    end

    describe '#total_distance' do
        it 'returns double the distance if it is not a loop' do
            ride1 = Ride.new({name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills})
            expect(ride1.total_distance).to eq(21.4)
        end
    end
end