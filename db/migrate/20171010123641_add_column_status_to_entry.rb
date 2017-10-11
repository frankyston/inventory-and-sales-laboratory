class AddColumnStatusToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :status, :string
  end
end
