require 'rails_helper'

describe StripePaymentsApi, :type => :feature do

  before { StripeMock.start }
  after { StripeMock.stop }

  let(:producer) { create(:producer) }
  let(:line_item) { create(:line_item, producer: producer, cost: 40) }
  let(:payment) { create(:payment, line_item: line_item) }

  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:token) { stripe_helper.generate_card_token }

  it 'creates recipient account' do
    recipient = StripePaymentsApi::create_recipient producer, token
    expect(recipient.cards.total_count).to eq 1
    expect(producer.recipient_id).to eq recipient.id
  end

  it 'errors if trying to create existing recipient account' do 
    expect do
      2.times { StripePaymentsApi::create_recipient producer, token }
    end.to raise_error
  end

  it 'retrieves recipient' do 
    StripePaymentsApi::create_recipient producer, token
    expect(StripePaymentsApi::get_recipient(producer).name).to eq producer.name
  end

  it 'transfers money to recipient' do 
    StripePaymentsApi::create_recipient producer, token
    transfer = StripePaymentsApi::transfer payment
    expect(transfer.amount).to eq 30
    expect(transfer.status).to eq 'pending'
    expect(payment.transfer_id).to eq transfer.id
  end
  
end
