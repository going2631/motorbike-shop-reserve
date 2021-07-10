class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.time :integer, null: false
      
      t.timestamps
    end
  end
end
