require 'spec_helper'

describe "exams/edit" do
  before(:each) do
    @exam = assign(:exam, stub_model(Exam,
      :description => "MyText",
      :patient_id => 1
    ))
  end

  it "renders the edit exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exam_path(@exam), "post" do
      assert_select "textarea#exam_description[name=?]", "exam[description]"
      assert_select "input#exam_patient_id[name=?]", "exam[patient_id]"
    end
  end
end
