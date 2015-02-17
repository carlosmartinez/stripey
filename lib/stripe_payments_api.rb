module StripePaymentsApi
  def self.create_account(name, email, token)
    customer = Stripe::Customer.create(description: name, email: email, card: token)
    customer
  end
end