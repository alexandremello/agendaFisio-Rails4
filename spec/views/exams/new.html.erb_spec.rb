require 'spec_helper'

describe "exams/new" do
  before(:each) do
    assign(:exam, stub_model(Exam,
      :description => "MyText",
      :patient_id => 1
    ).as_new_record)
  end

  it "renders new exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exams_path, "post" do
      assert_select "textarea#exam_description[name=?]", "exam[description]"
      assert_select "input#exam_patient_id[name=?]", "exam[patient_id]"
    end
  end
end
