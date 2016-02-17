class AddItemSet < ActiveRecord::Migration
  def change
    create_table :item_sets do |t|
      t.integer :item_id, index: true
      t.string :name
      t.string :description
    end    
  end
end
