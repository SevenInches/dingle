json.status :success
json.data do
  json.array! @addresses do |address|
    json.id address.id
    json.name address.try(:total_name) || ''
    json.phonecall address.try(:phonecall) || ''
    json.tag_name address.try(:tag_name) || ''
    json.address address.try(:address) || ''
  end
end