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

  def total_inventory
    total = Hash.new { |hash, key| hash[key] = {} }
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if total[item][:quantity].nil?
          total[item][:quantity] = quantity
          total[item][:vendors] = [vendor]
        else
          total[item][:quantity] += quantity
          total[item][:vendors] << vendor
        end
      end
    end
    total
  end             

  def overstocked_items
    total_inventory.map do |item, data|
      item if data[:quantity] > 50 && data[:vendors].count > 1
    end.compact
  end     
  
end 
