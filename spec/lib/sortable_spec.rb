require 'spec_helper'

describe Whisper::Sortable do
  before :each do
    @class = Class.new
    @class.send :include, Mongoid::Document
    @class.send :include, Whisper::Sortable
    @class.collection_name = "#{rand}"
    @object = @class.new
  end
  
  it "should have field 'position'" do
    @object.should have_field(:position).of_type(Integer)
  end
  
  describe "sort" do
    before :each do
      @object0 = @class.create! :position => 0
      @object1 = @class.create! :position => 1
      @object2 = @class.create! :position => 2
      @ids = [@object1, @object0, @object2].map(&:id)
    end

    it "should be able to sort stuff" do
      @ids.should_not be_nil
      @class.sort @ids
      
      @class.find(@object1.id).position.should be == 0
      @class.find(@object0.id).position.should be == 1
      @class.find(@object2.id).position.should be == 2
    end
  end
end


