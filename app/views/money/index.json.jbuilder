json.array!(@money) do |money|
  json.extract! money, :id, :amount, :deposit, :organization, :date
  json.url money_url(money, format: :json)
end
