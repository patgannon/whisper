require 'spec_helper'

describe Page do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:html).of_type(String) }
  it { should be_referenced_in(:project) }
end

