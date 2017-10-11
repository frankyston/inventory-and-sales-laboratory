class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.decimal :value_total
      t.references :customer, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
