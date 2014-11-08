json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :description, :is_sell
  json.url listing_url(listing, format: :json)
end
