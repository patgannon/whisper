require 'spec_helper'

describe Article do
  it {should be_referenced_in(:project)}
  
  it {should_not accept_values_for(:title, nil)}
end
