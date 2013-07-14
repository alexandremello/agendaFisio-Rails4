FactoryGirl.define do
	factory :patient do
		sequence(:name) { |i| "Jose#{i}" }
		birth Date.new(1986, 07, 10)

		factory :patient_with_user do
			association :user
		end

		factory :patient_with_exam do
			#association :exam
		end

		factory :patient_with_appointment do
			association :appointment
		end
	end
end