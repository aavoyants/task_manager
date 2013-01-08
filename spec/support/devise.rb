module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      curr_user = FactoryGirl.create(:user, id: 4, email: "time_#{Time.now.strftime("%H:%M")}@gmail.com")
      sign_in :user, curr_user
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
end
