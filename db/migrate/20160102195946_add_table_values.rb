class AddTableValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.belongs_to :property, index: true
      t.belongs_to :item, index: true
      t.integer :value
    end    
  end
end
