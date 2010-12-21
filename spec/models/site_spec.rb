require 'spec_helper'

describe Site do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:body).of_type(String) }
  it { should reference_many(:users).of_type(User) }
end

