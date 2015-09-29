require 'rails_helper'

RSpec.describe "forms/new", type: :view do
  before(:each) do
    assign(:form, Form.new())
  end

  it "renders new form form" do
    render

    assert_select "form[action=?][method=?]", forms_path, "post" do
    end
  end
end
