json.array!(@contacts) do |contact|
  json.extract! contact, :id, :firstname, :lastname, :address, :email, :phonenumber
  json.url contact_url(contact, format: :json)
end
