class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :time
      t.text :description
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
