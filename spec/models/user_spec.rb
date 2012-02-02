require "spec_helper"

describe User do
  it { should have_many(:lists) }
  it { should have_many(:tasks_to_do) }
  it { should have_many(:collaborations) }

  it "should require password" do
    @user = User.new valid_attributes
    @user.password = nil
    @user.should_not be_valid
  end

  it "should generate random password" do
    @user = User.new name: 'Steve', email: 'email@mail.com'
    @user.generate_pwd!
    @user.should be_valid
  end
  
  it "should get username as email if name unspecified" do
    User.new(email: 'email@mail.com').username.should == 'email@mail.com'
  end

  it "should get username as name" do
    User.new(valid_attributes).username.should == 'Steve'
  end

  
  it "should be saved with valid attributes" do
    lambda{
      User.create valid_attributes
    }.should change{ User.count }.by 1
  end
  
  def valid_attributes
    {name: 'Steve', email: 'email@mail.com', password: 'qwe123'}
  end
end
