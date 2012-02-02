require 'spec_helper'

describe List do

  it { should have_many(:tasks).dependent(:destroy) }
  it { should belong_to(:project) }

  it { should belong_to(:user) }

  it "should require name" do
    List.create.errors[:name].should include("can't be blank")
  end
  
end
