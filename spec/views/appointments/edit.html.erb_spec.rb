require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :description => "MyText",
      :patient_id => 1,
      :title => "MyString"
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do
      assert_select "textarea#appointment_description[name=?]", "appointment[description]"
      assert_select "input#appointment_patient_id[name=?]", "appointment[patient_id]"
      assert_select "input#appointment_title[name=?]", "appointment[title]"
    end
  end
end
