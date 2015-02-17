require 'rails_helper'
require 'stripe_payments_api'
require 'factory_girl_rails'

describe StripePaymentsApi, :type => :feature do

  let(:producer) { create(:producer) }
  let(:line_item) { create(:line_item, producer: producer) }
  let(:payment) { create(:payment, line_item: line_item) }

  it 'does not very much' do
    expect(producer.name).to eq 'Arbitrary Producer'
  end
end
