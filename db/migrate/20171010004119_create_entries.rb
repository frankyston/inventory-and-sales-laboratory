class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :quantity
      t.decimal :value_unit
      t.decimal :value_total
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
