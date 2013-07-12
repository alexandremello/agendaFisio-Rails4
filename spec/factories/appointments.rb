FactoryGirl.define do
	factory :appointment do
		:start DateTime.now
		:end DateTime.now.advance(minutes: 45)
		association :patient		
	end
end