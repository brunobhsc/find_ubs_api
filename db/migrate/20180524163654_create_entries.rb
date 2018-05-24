class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.references :score, foreign_key: true

      t.timestamps
    end
  end
end
