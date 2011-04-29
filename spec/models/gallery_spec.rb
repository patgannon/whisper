require 'spec_helper'

describe Gallery do
  it {should belong_to(:project)}
  it {should have_many(:images)}
  it {should have_field(:name)}
  it {should_not accept_values_for(:name, nil)}
end
