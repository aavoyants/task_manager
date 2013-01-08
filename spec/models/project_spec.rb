require 'spec_helper'

describe Project do
  describe "validations" do
    subject { FactoryGirl.create(:project, name: 'feed the cat') }

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

    it "is not valid with duplicate name within user" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:project, user: user, name: 'Important stuff')
      project = Project.new(user_id: user.id, name: 'Important stuff')
      project.should_not be_valid
    end
  end
end
