class AddColumnsToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :location_name, :string
  	add_column :events, :location_photo_url, :string
  	add_column :events, :location_url, :string
  	add_column :events, :location_street_address, :string
  	add_column :events, :location_city, :string
  end
end
