class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :icon
      t.boolean :state, default: false
      t.string :name
      t.integer :room_id
      t.integer :gpio

      t.timestamps
    end
  end
end
