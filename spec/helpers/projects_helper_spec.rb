require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProjectsHelper. For example:
#
# describe ProjectsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ProjectsHelper do
  describe "task class" do
    let(:task) do
      project = FactoryGirl.create(:project, name: 'visit grandma')
      FactoryGirl.create(:task, project: project, name: 'wear shoes')
    end

    specify "expired task" do
      task.stub(:'expired?').and_return(true)
      helper.task_class(task).should == " expired"
    end

    specify "done task" do
      task.is_done = true
      helper.task_class(task).should == " done"
    end

    specify "regular task" do
      helper.task_class(task).should == ""
    end
  end
end
