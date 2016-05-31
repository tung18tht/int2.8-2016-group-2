#Signing up test
Given(/^a logged in user$/) do
   @user = User.create!({
             :email => "testing@usth.edu.vn",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
  visit new_user_session_path
  fill_in "Email", :with => 'testing@usth.edu.vn'
  fill_in "Password", :with => '12345678'
  click_button "LOG IN"
end
When(/^I go to the home page$/) do
	visit root_path
end
When(/^I click on sign up$/) do
	click_on "Sign Up"
end
Then(/^I should see the sign up page$/) do
	expect(current_path).to eq(new_user_registration_path)
end
When(/^I go to the sign up page$/) do
	visit new_user_registration_path
end
When(/^I follow \"profiles\/1\/edit\"$/) do 
  visit "/profiles/1/edit"
end
When(/^I fill in form$/) do
	fill_in "Email", :with => 'testing@usth.edu.vn'
	fill_in "Password", :with => '12345678'
	fill_in "Password confirmation", :with => '12345678'
end
When(/^I click on sign up button$/) do
	click_button "SIGN UP"
end
Then(/^I should be redirected to home page$/) do
 	expect(current_path).to eq(root_path)
end
Then(/^I'm automatically logged in$/) do
  expect(page).to have_content("Signed in as testing@usth.edu.vn")
end
Then(/^I should see my email$/) do
  expect(page).to have_content("Signed in as testing@usth.edu.vn")
end
Then(/^I should not see the Sign up option$/) do
  expect(page).not_to have_content("Sign Up")
end
Then(/^I should see the Sign out option$/) do
  expect(page).to have_content("Sign Out")
end
Then(/^I should see Find Friends$/) do
  expect(page).to have_content("Find Friends")
end
Then(/^I should see Matches$/) do
  expect(page).to have_content("Matches")
end


#Signing out test
When(/^I click on sign out$/) do
  click_on "Sign Out"
end
Then(/^I should see the Sign in button$/) do
  expect(page).to have_content("Sign In")
end

# Posts test
When(/^I click on new post$/) do
  click_on "New Post"
end
Then(/^I should see the new post page$/) do
  expect(current_path).to eq(new_post_path)
end
When(/^I upload an image$/) do
  attach_file 'post[image]', 'public/jc.png'
end
When(/^I input a caption$/) do
  fill_in "Caption", :with => 'Demo'
end
When(/^I click on create post button$/) do
  click_button "Post"
end
Then(/^I should be redirected to the post page$/) do
	expect(current_path).to eq('/posts/1')
end
Then(/^I should see my post$/) do
  expect(page).to have_xpath("//img[contains(@src,'jc.png')]")
  expect(page).to have_content('Demo')
end
Then(/^I should be able to edit$/) do
  expect(page).to have_content('Edit')
end

#Edit post
Given(/^I uploaded a post$/) do
  visit new_post_path
  attach_file 'post[image]', 'public/jc.png'
  fill_in "Caption", :with => 'Demo'
  click_button "Post"
end
When(/^I go to my profile$/) do
  click_on "My Profile"
end
When(/^I click edit post$/) do
  click_on "Edit"
end
Then(/^I should be redirected to the edit page$/) do
  expect(current_path).to eq('/posts/1/edit')
end
When(/^I edit the caption$/) do
  fill_in "Caption", :with => 'Edited demo'
  click_button 'Post'
end
Then(/^I should be redirected my post$/) do
  expect(current_path).to eq('/posts/1')
end
Then(/^I should see the new caption$/) do
  expect(page).to have_content('Edited demo')
end
Then(/^I should not see my post$/) do 
  expect(page).to have_no_content('Demo')
end
When(/^I click delete post$/) do
  click_on "Delete"
end



#Find another users

When(/^I click on find friends$/) do
  click_on "Find Friends"
end
Then(/^I should see find friends intro$/) do
  expect(page).to have_content('Find people with the same interest')
end
Then(/^I should see the other users$/) do
  expect(page).to have_content('Test2')
end

Given(/^an user who has a profile$/) do
   @user = User.create!({
             :email => "testing@usth.edu.vn",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
  visit new_user_session_path
  fill_in "Email", :with => 'testing@usth.edu.vn'
  fill_in "Password", :with => '12345678'
  click_button "LOG IN"
  visit new_profile_path
  attach_file 'profile_avatar', 'public/jc.png'
  fill_in "User name", :with => 'Test'
  fill_in "Age", :with => '20'
  choose('Male')
  fill_in "Location", :with => "Hanoi"
  fill_in "Intro", :with => "Hello"
  fill_in "profile[interest]", :with => "sleep"
  click_button "Create Profile"
end

Given(/^another user who has a profile$/) do
   @user = User.create!({
             :email => "testing2@usth.edu.vn",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
  visit new_user_session_path
  fill_in "Email", :with => 'testing2@usth.edu.vn'
  fill_in "Password", :with => '12345678'
  click_button "LOG IN"
  visit new_profile_path
  attach_file 'profile_avatar', 'public/jc.png'
  fill_in "User name", :with => 'Test2'
  fill_in "Age", :with => '20'
  choose('Male')
  fill_in "Location", :with => "Hanoi"
  fill_in "Intro", :with => "Hello"
  fill_in "profile[interest]", :with => "sleep"
  click_button "Create Profile"
  click_on "Sign Out"
end

# Profile
When(/^I click on Create Profile$/) do
  click_on "Create your profile"
end

Then(/^I should see the Create Profile page$/) do
  expect(current_path).to eq(new_profile_path)
end

Then(/^I should see Create your profile button$/) do
  expect(page).to have_content("Create your profile")
end

When(/^I fill my information$/) do 
  attach_file 'profile_avatar', 'public/jc.png'
  fill_in "User name", :with => 'Test'
  fill_in "Age", :with => '20'
  choose('Male')
  fill_in "Location", :with => "Hanoi"
  fill_in "Intro", :with => "Hello"
  fill_in "profile[interest]", :with => "sleep"
  click_button "Create Profile"
end

Then(/^I should be redirected to the profile page$/) do
  expect(current_path).to eq('/users/1')
end

Then(/^I should see my information$/) do
  expect(page).to have_content('Test')
  expect(page).to have_content('20')
  expect(page).to have_content('Hanoi')
  expect(page).to have_content('Hello')
  expect(page).to have_content('sleep')
end

# Edit profile
When(/^I click edit profile$/) do
  click_on "Edit profile"
end

Then(/^I should be redirected to the edit profile page$/) do
  expect(current_path).to eq("/profiles/1/edit")
end

When(/^I edit my information$/) do
  fill_in "User name", :with => 'New test'
  fill_in "Age", :with => '22'
  click_button "Update Profile"
end

Then(/^I should see my new information$/) do
  expect(page).to have_content('New test')
  expect(page).to have_content('22')
end

#Like other profile
  Given(/^I am in find friend page/)do
    visit users_path
  end
  #When(/^I press "([^"]*)"$/) do |button|
  When(/^I click on "Like"$/) do
    find('#like_user_1', :visible => false).click
#    find(:css, 'span[title="Like"]', :visible => false).click
  end
    #And user infomation should disappear
  Then (/^I should not see that user information/) do
    expect(page).to have_no_content("Test2")
    expect(page).to have_no_content("20")
    expect(page).to have_no_content("Hello")
  end
  #Match Users
  Then (/^I click on "Sign Out"/) do
    click_on "Sign Out"
  end
  Then (/^that user log in/) do
    visit root_path
    click_on "Sign In"
    fill_in "Email", :with => 'testing2@usth.edu.vn'
    fill_in "Password", :with => '12345678'
    click_button "LOG IN"
  end
  Then (/^that user click on "Like"/) do
    visit users_path
    find('#like_user_2' , :visible => false).click
  end
  Then (/^that user should not see my information/) do
    expect(page).to have_no_content("Test")
    expect(page).to have_no_content("20")
    expect(page).to have_no_content("Hello")
  end
  Then (/^that user visit matches page/) do
    visit matches_path
  end
  Then (/^that user should see match intro/) do
    expect(page).to have_no_content("There are 1 match")
  end 
  Then (/^that user should see the other users who like them/) do
    expect(page).to have_no_content("Test2")
  end
  # Then (/^that user should see "Unlike"/) do
  # expect(page.html).should have_css('#unlike_matched_user_2', :visible => false)
  #  page.find('#unlike_user_1' , :visible => false)
  # end
  #Then (/^I should see "Chat"/) do
  # page.find('#chat_with_user_1', :visible => false )
  #end
  

#Superlike other profile
  When(/^I click on "Superlike"$/) do
    find('#super_like_user_1', :visible => false).click
  end

  Given(/^that another user who has a profile$/) do
  click_on "Sign Out"
  click_on "Sign In"
  fill_in "Email", :with => 'testing2@usth.edu.vn'
  fill_in "Password", :with => '12345678'
  click_button "LOG IN"
  visit new_profile_path
  attach_file 'profile_avatar', 'public/jc.png'
  fill_in "User name", :with => 'Test2'
  fill_in "Age", :with => '20'
  choose('Male')
  fill_in "Location", :with => "Hanoi"
  fill_in "Intro", :with => "Hello"
  fill_in "profile[interest]", :with => "sleep"
  click_button "Create Profile"
end
  
  Then(/^He should see some one superliked him$/) do
    visit users_path
    expect(page).to have_content("He has superliked you!")
  end
