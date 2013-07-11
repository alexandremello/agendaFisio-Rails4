FactoryGirl.define do
	factory :user do
		sequence(:email) { |i| "testing#{i}@alexandre-mello.pro" }
		password 'a0b1c2d4e60'
		admin false
		association :patient

		factory :user_admin do
			admin true
		end
	end
end