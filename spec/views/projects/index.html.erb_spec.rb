require 'spec_helper'

describe "projects/index" do
  before(:each) do
    project = FactoryGirl.create(:project, name: 'visit grandma')
    FactoryGirl.create(:task, project: project, name: 'wear shoes')
    assign(:projects, Project.all)
  end

  it "renders a list of projects" do
    render
    rendered.should contain "visit grandma"
    rendered.should contain "wear shoes"

    rendered.should have_selector 'h2', content: "visit grandma"
  end
end
