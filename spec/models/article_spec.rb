require 'spec_helper'

describe Article do
  it {should be_referenced_in(:project)}
end
