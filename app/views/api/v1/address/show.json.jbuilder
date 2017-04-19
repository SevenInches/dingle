json.status :success
json.data do
  json.name @address.try(:name) || ''
  json.gender @address.try(:gender) || ''
  json.title @address.try(:title) || ''
  json.phonecall @address.try(:phonecall) || ''
  json.address @address.try(:address) || ''
  json.tag @address.try(:tag) || 0
  json.tag_name @address.try(:tag_name) || ''
end