require "./lib/ride.rb"

RSpec.describe Ride do
    before(:all) do 
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@ride1).to be_an_instance_of (Ride)
        end

        it "can initialize wtih a name" do
            expect(@ride1.name).to eq('Walnut Creek Trail')
        end

        it "can initialize with distance" do
            expect(@ride1.distance).to eq(10.7)
        end

        it "can initialize with loop?" do
            expect(@ride1.loop).to be false
        end

        it "can initialize wtih terrain type" do
            expect(@ride1.terrain).to eq(:hills)
        end
    end

    describe "#total_distance" do
        it "can determine total distance with no loop" do
            expect(@ride1.total_distance).to eq (21.4)
        end

        it "can determine total distance with a loop" do
            expect(@ride2.total_distance).to eq (14.9)
        end


    end

end
