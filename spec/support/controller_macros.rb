module ControllerMacros
	def login_admin
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			user = FactoryGirl.create(:user_admin) # Using factory girl as an example
			sign_in user
			user
		end
	end

	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.create(:user)
			sign_in user
			user
		end
	end
end