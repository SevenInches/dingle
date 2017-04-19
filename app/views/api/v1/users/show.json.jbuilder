json.status :success
json.data do
  json.(@user, :id, :phone, :sex)
  json.nickname @user.nickname || ''
  json.money @user.money || 0
  json.avatar @user.avatar || ''
  json.source || ''
end