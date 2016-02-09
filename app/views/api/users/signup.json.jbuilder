json.access_token @token
json.user do
  json.id @user.user_id
  json.email @user.email
  json.password @user.password
  json.nickname @user.nickname
  json.phone @user.phone
  json.gender @user.gender
end
