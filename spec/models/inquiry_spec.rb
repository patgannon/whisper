require 'spec_helper'

describe Inquiry do
  it {should belong_to(:project)}
  it {should_not accept_values_for(:project, nil)}
  it {should_not accept_values_for(:name, nil)}
  it {should_not accept_values_for(:email, nil)}
  it {should_not accept_values_for(:subject, nil)}
  it {should_not accept_values_for(:message, nil)}
end

