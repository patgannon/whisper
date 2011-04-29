require 'spec_helper'

describe BusinessesController do

  before :each do
    create_default_project
    @business = Business.create! :id => 1
    #BusinessController.stub(:current_user_id).and_return("pat")
  end

  after :each do
    @business.delete
  end

  it "renders business info" do
    get :rate, :id => 1
    assigns(:business).should == @business
  end

  it "renders users existing rating if there is one" do
    rating_bill = Rating.new(
     :rating => 1, :comment => "terrible", :user_id => "bill")
    rating_pat = Rating.new(
     :rating => 2, :comment => "crummy", :user_id => "pat")
    rating_rachel = Rating.new(
     :rating => 3, :comment => "ok", :user_id => "rachel")
    @business.ratings = [rating_bill, rating_pat, rating_rachel]
    @business.save!
    get :rate, :id => 1
    assigns(:rating).should == rating_pat
  end

  it "rates an existing business" do
    post :rate, :id => 1, :rating => 4, :comment => "a comment"
    business = Business.find 1
    business.ratings.should have(1).rating
    doc = business.ratings[0]
    doc.rating.should == 4
    doc.comment.should == "a comment"
    doc.user_id.should == "pat"
  end

  it "can change an existing rating for the same user" do
    post :rate, :id => 1, :rating => 4, :comment => "a comment"
    post :rate, :id => 1, :rating => 2, :comment => "new comment"
    business = Business.find 1
    business.ratings.should have(1).rating
    doc = business.ratings[0]
    doc.rating.should == 2
    doc.comment.should == "new comment"
    doc.user_id.should == "pat"
  end
end
