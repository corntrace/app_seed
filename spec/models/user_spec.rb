require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be OK" do
    User.new.should respond_to(:crypted_password)
  end
end
