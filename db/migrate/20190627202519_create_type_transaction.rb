class CreateTypeTransaction < ActiveRecord::Migration[5.2]
  def change
    create_table :type_transactions do |t|
      t,integer :type, null: false
      t.string :description, null: false
      t.integer :nature, null: false
      t.integer :signal, null: false
      t.timestamps
    end
  end
end
