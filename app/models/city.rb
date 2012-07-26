class City < ActiveRecord::Base
  WIDTH = 100
  LENGTH = 100
  belongs_to :user
  before_create :default_values
  def default_values
    self.is_capital = false
    self.population = 100
    self.food = 0
    self.gold = 0
    self.tax = 0.2
  end
  def to_regular
    update_attribute(:is_capital, false)
  end
  def to_capital
    update_attribute(:is_capital, true)
  end
end
