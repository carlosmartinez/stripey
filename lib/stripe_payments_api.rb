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

  def self.get_recipient(producer)
    Stripe::Recipient.retrieve(producer.recipient_id)
  end

  def self.transfer(payment)
    transfer = Stripe::Transfer.create(
      amount: payment.amount,
      currency: 'usd',
      recipient: payment.line_item.producer.recipient_id,
      description: 'money innit'
    )
    payment.update_attributes!(transfer_id: transfer.id)
    transfer
  end
end