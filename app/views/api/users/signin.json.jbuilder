json.access_token @user.user_auths.last.access_token
json.user do
  json.id @user.id
  json.email @user.email
  json.password @user.password
  json.nickname @user.nickname
  json.phone @user.phone
  json.gender @gender
end
