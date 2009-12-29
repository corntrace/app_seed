Given /^an existed user:? "([^\"]*)"$/ do |username|
  Given %Q|a user exists with username: "#{username}", email: "#{username}@email.com", password: "secret", password_confirmation: "secret"|
end

Then /there should be no new user created/ do
  User.all.size.should == 1
end

Then /^the user "([^\"]*)"'s message should not be changed$/ do |username|
  user = User.find_by_username(username)
  user.created_at.should == user.updated_at
end
