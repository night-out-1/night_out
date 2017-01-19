class AddColumnToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :location_postal_code, :string
  end
end
