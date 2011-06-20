require 'spec_helper'

describe "twsses/edit.html.erb" do
  before(:each) do
    @twss = assign(:twss, stub_model(Twss))
  end

  it "renders the edit twss form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => twsses_path(@twss), :method => "post" do
    end
  end
end
