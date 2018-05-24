class CreateGeocodes < ActiveRecord::Migration[5.1]
  def change
    create_table :geocodes do |t|
      t.decimal :lat
      t.decimal :long
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
