require 'spec_helper'

describe MenuItem do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:target_class).of_type(String) }
  it { should have_field(:target_id).of_type(BSON::ObjectId) }
  it { should have_field(:position).of_type(Integer) }
  
  describe "sets title" do
    before :each do
      @page = Page.create(:title => 'nicebar')
      @menu_item = MenuItem.create(:target => @page)
    end
    it "should be able to set and get the target" do
      same_menu_item = MenuItem.find(@menu_item.id)
      same_menu_item.target.should be == @page
      @menu_item.target.should be == @page
      @menu_item.target_class.should be == "Page"
      @menu_item.target_id.should be == @page.id
    end
    
    it "should set the title to the target title if present" do
      same_menu_item = MenuItem.find(@menu_item.id)
      same_menu_item.title.should be == @page.title
    end
  end
  
  describe "doesn't set title if already set" do
    before :each do
      @page = Page.create(:title => 'nicebar')
      @menu_item = MenuItem.create(:title => "Foolbar",  :target => @page)
    end
    
    it "should get the target right." do
      same_menu_item = MenuItem.find(@menu_item.id)
      same_menu_item.title.should be == "Foolbar"
    end
  end
end
