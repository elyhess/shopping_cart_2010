class Item
  attr_reader :name, :price

  def initialize(data)
    @name = data[:name]
    @price = data[:price][1..4].to_f
  end            

end                      # => :initialize
