json.array!(@responses) do |response|
  json.extract! response, :id, :party_size, :comment, :food_restrictions, :responded_with, :invitation_id
  json.url response_url(response, format: :json)
end
