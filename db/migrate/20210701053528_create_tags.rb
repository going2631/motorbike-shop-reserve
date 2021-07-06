class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      
      t.integer :tag_infomation_id,null: false
      t.integer :column_id,null: false
      

      t.timestamps
    end
  end
end
