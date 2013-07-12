FactoryGirl.define do
	factory :appointment do
		start DateTime.now

		association :patient
	end
end