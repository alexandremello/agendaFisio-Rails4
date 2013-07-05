require 'spec_helper'

describe "appointments/show" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :description => "MyText",
      :patient_id => 1,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Title/)
  end
end
