require 'spec_helper'

describe Project do

  it { should have_many(:lists).dependent(:destroy) }
  it { should have_many(:tasks).through(:lists) }
  it { should have_many(:collaborations) }
  it { should have_many(:users).through(:collaborations) }

  it { should belong_to(:author) }

  it "should require name" do
    Project.create.errors[:name].should include("can't be blank")
  end
  
end
