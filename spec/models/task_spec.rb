require 'spec_helper'

describe Task do
  
  it { should belong_to(:list) }
  it { should belong_to(:author) }
  it { should belong_to(:assigned) }

  it "should require name" do
    @task = Task.new valid_attributes.except(:name)
    @task.should_not be_valid
  end

  it "should require priority" do
    @task = Task.new valid_attributes.except(:priority)
    @task.should_not be_valid    
  end

  it "should require list id" do
    @task = Task.new valid_attributes.except(:list_id)
    @task.should_not be_valid    
  end

  it "should be saved with valid data" do
    lambda { 
      @task = Task.new valid_attributes
      @task.stub!(:notify).and_return(true)
      @task.save
    }.should change{ Task.count }.by 1
  end
  
  it "should notify by email when assigned" do
    Task.create valid_attributes.merge(assigned_id: create(:user).id)
    ActionMailer::Base.deliveries.should_not be_empty
  end
  
  it "should notify by email on changes" do
    @task = Task.create valid_attributes.merge(assigned_id: create(:user).id, author_id: create(:user).id)
    lambda {
      @task.update_attributes status: :resolved
    }.should change{ ActionMailer::Base.deliveries.count }
  end
  
  def valid_attributes
    {name: "feed a cat", desc: "cat food $4.90", list_id: 1, priority: 1, status: :new}
  end
end
