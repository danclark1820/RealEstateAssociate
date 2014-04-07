require 'spec_helper'

describe Building do
  it {should_not have_valid(:address).when('', nil)}
  it {should_not have_valid(:city).when('', nil)}
  it {should_not have_valid(:state).when('', nil)}
  it {should_not have_valid(:zip).when('', nil)}
end
