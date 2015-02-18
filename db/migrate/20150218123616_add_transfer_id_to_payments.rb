class AddTransferIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :transfer_id, :string
  end
end
