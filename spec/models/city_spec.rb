require 'spec_helper'

describe City do
  before do
    @user = create(:user)
    @city = create(:city)
    @city.user = @user
  end
  it "should belong to user" do
    @city.user.should == @user
  end

  it "a city could be changed from regular to capital, and vice versa" do
    @city.to_regular
    @city.is_capital.should == false
    @city.to_capital
    @city.is_capital.should == true
  end

  it " new city has default 100 population, 0 food, 0 gold, 0.2 as tax rate
    (新的城市开始仅有100人口， 没有食物，没有金子，初始税率为20%。" do
    @city.population.should == 100
    @city.food.should == 0
    @city.gold.should == 0
    @city.tax.should == 0.2
  end

  it "only 1 capital for a user" do
    @user.cities << @city
    @user.set_capital_city(@city)
    @user.capital_city.should == @city
    @city.is_capital.should == true

    a_new_city = create(:city)
    @user.cities << a_new_city
    @user.set_capital_city(a_new_city)
    @user.capital_city.should == a_new_city
    a_new_city.is_capital.should == true
    @city.is_capital.should == false
  end

  it "user:a can't set user:b 's city as his capital city" do
    jim = create(:user, :name => "Jim")
    jim.cities << create(:city)
    lilei = create(:user, :name => "Li Lei")
    lilei.cities << create(:city)
    lambda {lilei.set_capital_city(jim.cities.first)}.should raise_error
  end

  it "as a regular city, should product 1000 food per hour" do
    pending "use another class ? (spawn)"
    @city.product_food(3600).should == 1000
  end

  it "as a capital city, should product 10000 food per hour" do
    pending "use another class ? (spawn)"
    @city.update_attribute(:is_capital, true)
    @city.product_food(3600).should == 10000
  end
end
