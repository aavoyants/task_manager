require 'spec_helper'

describe Task do
  describe "validations" do
    subject do
      project = FactoryGirl.create(:project, name: 'feed the cat')
      FactoryGirl.create(:task, project: project, name: 'buy milk')
    end

    it "is valid with valid attributes" do
      should be_valid
    end

    it "is not valid without a name" do
      subject.name = ''
      should_not be_valid
    end

    it "is not valid if name contains only spaces" do
      subject.name = '  '
      should_not be_valid
    end

    it "is not valid with duplicate name within project" do
      project = FactoryGirl.create(:project)
      FactoryGirl.create(:task, project: project, name: 'do smth')
      task = Task.new(project_id: project.id, name: 'do smth')
      task.should_not be_valid
    end
  end

  describe "default order" do
    it "arranges project tasks by rank" do
      project = FactoryGirl.create(:project)
      [1, 3, 2].each{|rank| FactoryGirl.create(:task, project: project, rank: rank) }
      project.tasks.map(&:rank).should == [3, 2, 1]
    end
  end
end
