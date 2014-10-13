json.array! @train.seats_by_date.each do |s|
  json.id s["id"]
  json.reservation_id s["reservation_id"]
end