class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      
      t.integer :service_id,null: false
      t.integer :customer_id,null: false
      t.string :manufacturer,null: false
      t.string :name,null: false
      t.string :displacement,null: false
      t.datetime :start_time,null: false
      t.datetime :finish_time,null: false

      t.timestamps
    end
  end
end
