class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :cost
      t.references :producer, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :producers
  end
end
