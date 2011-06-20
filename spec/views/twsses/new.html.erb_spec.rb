require 'spec_helper'

describe "twsses/new.html.erb" do
  before(:each) do
    assign(:twss, stub_model(Twss).as_new_record)
  end

  it "renders new twss form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => twsses_path, :method => "post" do
    end
  end
end
