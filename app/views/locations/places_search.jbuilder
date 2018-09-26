json.places @places do |place|
  json.(place, :place_id, :name, :formatted_address)
end
