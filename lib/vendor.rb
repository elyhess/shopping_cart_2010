class Vendor 
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new {|hash, key| hash[key] = 0}
  end

end