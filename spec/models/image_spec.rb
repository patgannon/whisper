require 'spec_helper'

describe Image do
  it {should belong_to(:gallery)}
  it {should_not accept_values_for(:gallery, nil)}
  it {should_not accept_values_for(:image_file_name, nil)}
end
