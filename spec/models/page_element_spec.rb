require 'spec_helper'

describe PageElement do
  it {should belong_to(:page).as_inverse_of(:elements)}
  it {should include_module(Whisper::Sortable)}
end
