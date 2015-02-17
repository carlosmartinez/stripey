class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :line_item, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :line_items
  end
end
