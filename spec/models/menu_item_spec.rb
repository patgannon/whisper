require 'spec_helper'

describe MenuItem do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:target_class).of_type(String) }
  it { should have_field(:target_id).of_type(BSON::ObjectId) }
  
  it "should be able to set and get the target" do
    page = Page.create(:title => 'nicebar')
    
    menu_item = MenuItem.create(:target => page)
    
    menu_item.target.should be == page
    menu_item.target_class.should be == "Page"
    menu_item.target_id.should be == page.id
    
    same_menu_item = MenuItem.find(menu_item.id)
    same_menu_item.target.should be == page
    
    same_menu_item.target.should be == page.title
  
  end
end
