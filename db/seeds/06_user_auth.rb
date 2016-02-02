include UsersHelper

User.all.each do |user|
  UsersHelper.gen_user_auth(user)
end
