require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user_name => "User Name",
      :age => "Age",
      :gender => "Gender",
      :location => "Location",
      :intro => "MyText",
      :interest => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
