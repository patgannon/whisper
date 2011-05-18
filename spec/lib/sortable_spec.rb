require 'spec_helper'

describe Whisper::Sortable do
  before :each do
    @class = Class.new
    @class.send :include, Mongoid::Document
    @class.send :include, Whisper::Sortable
    @class.collection_name = "#{rand}"
    @class.send :field, :coolio, :type => Integer
    @object = @class.new
  end
  
  it "should have field 'position'" do
    @object.should have_field(:position).of_type(Integer)
  end
  
  describe "sort" do
    before :each do
      @object0 = @class.create! :position => 0, :coolio => 2
      @object1 = @class.create! :position => 1, :coolio => 2
      @object2 = @class.create! :position => 2, :coolio => 2
      @ids = [@object1, @object0, @object2].map(&:id)
      @ids.should_not be_nil
      @class.sort @ids
    end

    it "should be able to sort stuff" do
      @class.find(@object1.id).position.should be == 0
      @class.find(@object0.id).position.should be == 1
      @class.find(@object2.id).position.should be == 2
    end
    
    it "should automatically load according to position" do
      @class.where(:coolio => 2).first.should be == @object1
      @class.where(:coolio => 2).last.should be == @object2
    end
  end
end

