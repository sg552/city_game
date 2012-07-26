class User < ActiveRecord::Base
  has_many :cities, :before_add => :check_cities_limit
  def check_cities_limit city
    raise "reached max cities size" if self.cities.size == 10
  end
end
