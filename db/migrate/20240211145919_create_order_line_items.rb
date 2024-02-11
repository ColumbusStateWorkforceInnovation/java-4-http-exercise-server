class CreateOrderLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_line_items do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :count
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
