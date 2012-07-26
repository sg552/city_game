require 'spec_helper'

describe User do
  before do
    @user = create(:user)
  end
  it "should have many cities" do
    @user.cities << create(:city)
    @user.cities.size.should == 1
  end

  it "should have at most 10 cities" do
    (1..10).each do |i|
      @user.cities << create(:city)
    end
    lambda { @user.cities << create(:city) }.should raise_error
  end

end
