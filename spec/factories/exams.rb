FactoryGirl.define do
	factory :exam do
		sequence(:date) { |i| (Date.today - i) }
		description 'Primeiro exame'
		association :patient
	end
end