FactoryGirl.define do
	factory :appointment do
		sequence(:start) { |i| (DateTime.now - i) }
		association :patient

		factory :appointment_today do
			start { DateTime.now }
		end

		factory :appointment_next do
			sequence(:start) { |i| (DateTime.now + i) }
		end

		factory :appointment_prior do
			sequence(:start) { |i| (DateTime.now - 1) }
		end
	end
end