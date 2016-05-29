require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :avatar => File.new(Rails.root + 'spec/fixtures/jc.png'),
        :user_name => "User Name",
        :age => 20,
        :gender => "Male",
        :location => "Location",
        :intro => "MyIntro",
        :interest => "MyInterest",
        :user => nil
      ),
      Profile.create!(
        :avatar => File.new(Rails.root + 'spec/fixtures/jc.png'),
        :user_name => "User Name",
        :age => 20,
        :gender => "Male",
        :location => "Location",
        :intro => "MyIntro",
        :interest => "MyInterest",
        :user => nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Male".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyIntro".to_s, :count => 2
    assert_select "tr>td", :text => "MyInterest".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
