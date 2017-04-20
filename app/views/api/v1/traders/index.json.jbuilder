json.status :success
json.total @traders.count
json.data do
  json.array! @traders.each do |trader|
    json.(trader, :id, :title)
    json.logo trader.try(:logo) || ''
    json.is_brand trader.try(:is_brand) || false
    json.branch trader.try(:branch) || ''
    json.scores trader.try(:scores) || 0.0
    json.order_total trader.try(:order_total) || 0

  end
end
