require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :name => "MyString",
      :company_name => "MyString",
      :company_type => "MyString",
      :company_address => 1,
      :company_address => "MyString",
      :company_description => "MyText",
      :country_id => 1,
      :state_id => 1,
      :city => "MyString",
      :zip => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_name", :name => "post[name]"
      assert_select "input#post_company_name", :name => "post[company_name]"
      assert_select "input#post_company_type", :name => "post[company_type]"
      assert_select "input#post_company_address", :name => "post[company_address]"
      assert_select "input#post_company_address", :name => "post[company_address]"
      assert_select "textarea#post_company_description", :name => "post[company_description]"
      assert_select "input#post_country_id", :name => "post[country_id]"
      assert_select "input#post_state_id", :name => "post[state_id]"
      assert_select "input#post_city", :name => "post[city]"
      assert_select "input#post_zip", :name => "post[zip]"
      assert_select "input#post_phone", :name => "post[phone]"
      assert_select "input#post_email", :name => "post[email]"
      assert_select "input#post_url", :name => "post[url]"
    end
  end
end
