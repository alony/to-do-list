require 'spec_helper'

describe Project do

  it "should require name" do
    Project.create.errors[:name].should include("can't be blank")
  end
  
end
