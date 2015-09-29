require 'rails_helper'

RSpec.describe "forms/edit", type: :view do
  before(:each) do
    @form = assign(:form, Form.create!())
  end

  it "renders the edit form form" do
    render

    assert_select "form[action=?][method=?]", form_path(@form), "post" do
    end
  end
end
