require 'spec_helper'

describe Page do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:html).of_type(String) }
  it { should have_field(:position).of_type(Integer) }
  it { should be_referenced_in(:project) }
  
  it { should have_many(:elements).of_type(PageElement) }
  
  it "should have its position set properly." do
    a = Page.create! :title => "Niceface"
    b = a.children.create! :title => "Dorkbag"
    c = a.children.create! :title => "Dorkbag22"
    
    c.position.should be == 1 
  end
  
end

