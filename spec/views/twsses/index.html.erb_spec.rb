require 'spec_helper'

describe "twsses/index.html.erb" do
  before(:each) do
    assign(:twsses, [
      stub_model(Twss),
      stub_model(Twss)
    ])
  end

  it "renders a list of twsses" do
    render
  end
end
