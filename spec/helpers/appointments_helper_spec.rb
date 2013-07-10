require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AppointmentsHelper. For example:
#
# describe AppointmentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe AppointmentsHelper do
  let(:appointment) { Appointment.new(start: '2013-07-10 19:00') }
  
  context 'format' do
  	it { helper.format_date(appointment.start).should == '10/07/2013' }

  	it { helper.format_time(appointment.start).should == '19h00min'}
  end

end
