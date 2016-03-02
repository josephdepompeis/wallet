class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :deposit
      t.string :organization
      t.date :date

      t.timestamps null: false
    end
  end
end
