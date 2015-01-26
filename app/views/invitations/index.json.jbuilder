json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :name, :party_size, :email
  json.url invitation_url(invitation, format: :json)
end
