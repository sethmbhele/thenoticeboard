require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
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
      ),
      stub_model(Post,
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
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Company Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
