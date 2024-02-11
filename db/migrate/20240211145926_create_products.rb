class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :cost

      t.timestamps
    end
  end
end
