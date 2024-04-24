require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'pry'

describe BikeClub do
    let(:club) {BikeClub.new('Awesome Bikers Club')}

    describe 'initialization' do
        it 'should return the name of the club' do
            expect(club.name).to eq('Awesome Bikers Club')
        end

        it 'should return an empty array of bikers' do
            expect(club.bikers).to eq([])
        end
    end
    
    describe '#add_biker' do
        it 'should add a biker to the club' do
            biker1 = Biker.new('Chuck', 20)
            club.add_biker(biker1)
            expect(club.bikers).to eq([biker1])
        end
    end
end