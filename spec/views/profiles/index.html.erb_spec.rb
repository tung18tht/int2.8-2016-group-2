require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user_name => "User Name",
        :age => "Age",
        :gender => "Gender",
        :location => "Location",
        :intro => "MyText",
        :interest => "MyText",
        :user => nil
      ),
      Profile.create!(
        :user_name => "User Name",
        :age => "Age",
        :gender => "Gender",
        :location => "Location",
        :intro => "MyText",
        :interest => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
