require 'rails_helper'
require 'stripe_payments_api'
require 'factory_girl_rails'
require 'stripe_mock'

describe StripePaymentsApi, :type => :feature do

  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:token) { stripe_helper.generate_card_token }
  before { StripeMock.start }
  after { StripeMock.stop }

  let(:producer) { create(:producer) }
  let(:line_item) { create(:line_item, producer: producer) }
  let(:payment) { create(:payment, line_item: line_item) }

  it 'creates recipient account' do
    customer = StripePaymentsApi::create_account producer.name, producer.email, token
    expect(customer.cards.total_count).to eq 1
  end

  it 'errors if trying to create existing recipient account' do 
    expect do
      2.times { StripePaymentsApi::create_account producer.name, producer.email, token }
    end.to raise_error
  end

  it 'creates payment to producer' do
    
  end

end
