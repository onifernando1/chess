require "/home/onifernando1/ruby/chess/lib/game.rb"


describe Game do 


    describe "#co_ordinate_converter" do 
        subject(:game) {described_class.new}

        before do 
            game.co_ordinate_converter("B1")
        end 
    
        it "Checks B1 returns [7,1]" do 
            expect(game.co_ordinates).to eql([7,1])
        end 
        subject(:new_game) {described_class.new}

        before do 
            new_game.co_ordinate_converter("F5")
        end 

        it "Checks F5 returns [3,5]" do
        expect(new_game.co_ordinates).to eql([3,5])
        end 
    end 
end  