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
end
