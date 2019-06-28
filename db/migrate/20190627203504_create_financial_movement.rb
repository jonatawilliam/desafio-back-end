class CreateFinancialMovement < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_movements do |t|
      t.references :user, foreign_key: true, null: false
      t.references :type_transaction, foreign_key: true, null: false
      t.datetime :date_occurrency, null: false
      t.decimal :value, null: false, precision: 15, scale: 2
      t.string :cpf, null: false
      t.string :card, null: false
      t.string :store_owner, null: false
      t.string :store_name, null: false
      t.timestamps
    end
  end
end
