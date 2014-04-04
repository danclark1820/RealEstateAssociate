require 'spec_helper'

describe Owner do
  it { should_not have_valid(:first_name).when(nil)}
  it { should_not have_valid(:last_name).when(nil)}
  it { should_not have_valid(:email).when(nil)}
end
