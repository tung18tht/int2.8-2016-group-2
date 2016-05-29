require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user_name => "MyString",
      :age => "20",
      :gender => "MyString",
      :location => "MyString",
      :intro => "MyText",
      :interest => "MyText",
      :user => nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

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
