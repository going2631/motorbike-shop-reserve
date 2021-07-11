class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      
      t.integer :admin_id,null: false
      t.string :image_id,null: false
      t.string :title,null: false
      t.text :text,null: false


      t.timestamps
    end
  end
end
