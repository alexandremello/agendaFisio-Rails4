FactoryGirl.define do
	factory :patient do
		sequence(:name) { |i| "Jose#{i}" }
		birth Date.new(1986, 07, 10)

		factory :patient_with_user do
			association :users
		end
	end
end