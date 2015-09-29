require 'rails_helper'

RSpec.describe "forms/index", type: :view do
  before(:each) do
    assign(:forms, [
      Form.create!(),
      Form.create!()
    ])
  end

  it "renders a list of forms" do
    render
  end
end
