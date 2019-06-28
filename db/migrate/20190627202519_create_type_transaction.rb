class CreateTypeTransaction < ActiveRecord::Migration[5.2]
  def change
    create_table :type_transactions do |t|
      t.string :description, null: false
      t.string :nature, null: false
      t.boolean :signal
      t.timestamps
    end
  end
end
