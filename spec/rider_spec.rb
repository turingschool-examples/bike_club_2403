require './lib/ride'
require './lib/biker'

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
end