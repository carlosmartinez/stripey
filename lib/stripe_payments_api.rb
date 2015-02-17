module StripePaymentsApi
	def self.create_account(token)
      customer = Stripe::Customer.create(description: 'dealership.name', card: token)
      customer
	end
end