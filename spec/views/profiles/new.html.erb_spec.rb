require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user_name => "MyString",
      :age => "MyString",
      :gender => "MyString",
      :location => "MyString",
      :intro => "MyText",
      :interest => "MyText",
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_user_name[name=?]", "profile[user_name]"

      assert_select "input#profile_age[name=?]", "profile[age]"

      assert_select "input#profile_gender[name=?]", "profile[gender]"

      assert_select "input#profile_location[name=?]", "profile[location]"

      assert_select "textarea#profile_intro[name=?]", "profile[intro]"

      assert_select "textarea#profile_interest[name=?]", "profile[interest]"

      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
    end
  end
end
