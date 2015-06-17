json.array!(@people) do |person|
  json.extract! person, :id, :login, :age, :about
  json.url person_url(person, format: :json)
end
