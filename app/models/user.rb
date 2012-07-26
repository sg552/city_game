class User < ActiveRecord::Base
  has_many :cities, :before_add => :check_cities_limit
  def check_cities_limit city
    raise "reached max cities size" if self.cities.size == 10
  end

  def set_capital_city city
    raise "can't set other's city as his capital" if city.user != self
    self.cities.each { |city| city.update_attribute(:is_capital, false) if city.is_capital }
    city.update_attribute(:is_capital, true)
  end

  def capital_city
    self.cities.each { |city | return city if city.is_capital }
    nil
  end
end
