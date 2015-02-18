require 'rails_helper'
require 'stripe_payments_api'
require 'factory_girl_rails'
require 'stripe_mock'

describe 'payment admin panel' do

  before { StripeMock.start }
  after { StripeMock.stop }

  let(:producer) { create(:producer) }
  let(:line_item1) { create(:line_item, producer: producer, cost: 40) }
  let(:line_item2) { create(:line_item, producer: producer, cost: 40) }
  let(:payment1) { create(:payment, line_item: line_item1) }
  let(:payment2) { create(:payment, line_item: line_item2) }

  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:token) { stripe_helper.generate_card_token }

  before do 
    StripePaymentsApi::create_recipient producer, token
    StripePaymentsApi::transfer payment1
    StripePaymentsApi::transfer payment2
  end

  it 'displays payments' do 
    visit '/payments'
    expect(page).to have_content(payment1.transfer_id)
    expect(page).to have_content(payment2.transfer_id)
  end
end