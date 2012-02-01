require 'spec_helper'

describe Task do


  it "should be saved with valid data" do
    lambda { 
      Task.create valid_attributes
    }.should change{ Task.count }.by 1
  end
  
  def valid_attributes
    {name: "feed a cat", desc: "cat food $4.90", list_id: 1, priority: 1, status: :new}
  end
end
