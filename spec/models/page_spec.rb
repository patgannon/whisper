require 'spec_helper'

describe Page do
  it { should have_field(:path_fragment).of_type(String) }
  it { should have_field(:name).of_type(String) }
  it { should have_field(:title).of_type(String) }
  it { should have_field(:body).of_type(String) }
  it { should have_field(:css).of_type(String) }




end

