class AddColumnsToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :county, :integer
    add_column :entries, :cnes, :integer
    add_column :entries, :district, :string
  end
end
