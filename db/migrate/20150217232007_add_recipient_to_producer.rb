class AddRecipientToProducer < ActiveRecord::Migration
  def change
    add_column :producers, :recipient_id, :string
  end
end