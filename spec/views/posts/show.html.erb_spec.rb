require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :name => "Name",
      :company_name => "Company Name",
      :company_type => "Company Type",
      :company_address => 1,
      :company_address => "Company Address",
      :company_description => "MyText",
      :country_id => 2,
      :state_id => 3,
      :city => "City",
      :zip => "Zip",
      :phone => "Phone",
      :email => "Email",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Company Name/)
    rendered.should match(/Company Type/)
    rendered.should match(/1/)
    rendered.should match(/Company Address/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/City/)
    rendered.should match(/Zip/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
    rendered.should match(/Url/)
  end
end
