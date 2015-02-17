module StripePaymentsApi
  def self.create_recipient(producer, token)
    recipient = Stripe::Recipient.create({
      type:  'individual',
      name: producer.name,
      bank_account: 'bank_account_token_1',
      card: token
    })
    producer.update_attributes!(recipient_id: recipient.id)
    recipient
  end
end