require 'spec_helper'

describe BusinessesController do
  #before :each do
  #end

  it "rates an existing business" do
    business = Business.create! :id => 1
    #business.should_receive(:create_rating).with(
    #  :rating => 4, :comment => "a comment")
    post :rate, :id => 1, :rating => 4, :comment => "a comment"
    business = Business.find 1
    business.ratings.should have(1).rating
  end
end
