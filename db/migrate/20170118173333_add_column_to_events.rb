class AddColumnToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :zip, :string
  end
end
