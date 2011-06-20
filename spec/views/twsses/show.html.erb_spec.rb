require 'spec_helper'

describe "twsses/show.html.erb" do
  before(:each) do
    @twss = assign(:twss, stub_model(Twss))
  end

  it "renders attributes in <p>" do
    render
  end
end
