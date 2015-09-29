require 'rails_helper'

RSpec.describe "forms/show", type: :view do
  before(:each) do
    @form = assign(:form, Form.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
