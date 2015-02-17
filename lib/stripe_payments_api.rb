module StripePaymentsApi
  def self.create_recipient(name, email, token)
    recipient = Stripe::Recipient.create({
      type:  'individual',
      name: name,
      bank_account: 'bank_account_token_1',
      card: token
    })
    recipient
  end
end