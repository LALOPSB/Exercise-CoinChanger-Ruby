require 'set'

class CoinChanger

  attr_accessor :currency_set

  def initialize
    @currency_set = Set.new
  end

  def add_currency_denomination(currency)
    @currency_set.add(currency)
  end

  def get_change(amount)
    rest = amount
    change = Hash[currency_set.to_a.product([0])]
    currency_set_sorted = currency_set.sort

    while (rest>=currency_set_sorted.first)
      highest_lower = currency_set_sorted.reverse.find{|e| e<=rest}
      number_of_coins = rest/highest_lower
      replacing_number = number_of_coins + change[highest_lower]
      change[highest_lower] = replacing_number
      rest%=highest_lower
      print(rest)
    end
    change
  end
end

