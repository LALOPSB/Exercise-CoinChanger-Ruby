describe 'coin_changer' do

  let(:model) do
    CoinChanger.new
  end

  describe "#new" do


    it 'should calculate_fibonacci_based_on_position' do
      model.should be_an_instance_of CoinChanger
    end

    it 'should have its currency denominations empty when its created' do
      expect(model.currency_set.size).to eq 0
    end

    it 'should add coin denominations to changer' do
      model.add_currency_denomination(10)
      expect(model.currency_set.size).to eq 1
    end

    it 'should not repeat denominations if added' do
      model.add_currency_denomination(1)
      model.add_currency_denomination(10)
      model.add_currency_denomination(1)
      expect(model.currency_set.size).to eq 2
    end

    it 'should return the same denomination when entering an amount of a denomination previously entered' do
      coin_changer_charged = CoinChanger.new
      coin_changer_charged.add_currency_denomination(10)
      coin_changer_charged.add_currency_denomination(1)
      coin_changer_charged.add_currency_denomination(5)
      expect(coin_changer_charged.get_change(10)[10]).to eq 1
    end

    it 'should return correct change when asking for it' do
      coin_changer_charged = CoinChanger.new
      coin_changer_charged.add_currency_denomination(1)
      coin_changer_charged.add_currency_denomination(5)
      coin_changer_charged.add_currency_denomination(10)
      coin_changer_charged.add_currency_denomination(25)
      expect(coin_changer_charged.get_change(90)[25]).to eq 3
      expect(coin_changer_charged.get_change(90)[10]).to eq 1
      expect(coin_changer_charged.get_change(90)[5]).to eq 1
    end
  end
end