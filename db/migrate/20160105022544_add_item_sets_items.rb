class AddItemSetsItems < ActiveRecord::Migration
  def change
    create_table :item_sets_items, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :item_set, index: true
    end
  end
end
