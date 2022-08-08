require "/home/onifernando1/ruby/chess/lib/game.rb"


describe Game do 

    subject(:game) {described_class.new}

    describe "#co_ordinate_converter" do 

        before do 
            game.co_ordinate_converter("B1")
        end 
    
        it "Checks B1 returns [7,1]" do 
            expect(game.co_ordinates).to eql([7,1])
        end 
    end 
end  