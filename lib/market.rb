class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end
  
  def vendors_that_sell(item)
    @vendors.reduce([]) do |container, vendor|
      container << vendor if vendor.inventory.include?(item)
      container
    end
  end
  
end 
