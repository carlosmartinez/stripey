describe Payment do 

  let(:producer) { create(:producer) }
  let(:line_item) { create(:line_item, producer: producer, cost: 40.00) }
  let(:payment) { create(:payment, line_item: line_item) }

  it 'allocates 75% of line item to producer' do 
  	expect(payment.amount).to eq 30.00
  end
end