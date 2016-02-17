class ExpandItems < ActiveRecord::Migration
  def change
    add_column :items, :wash_count, :integer
    add_column :items, :in_laundry, :boolean, default: false
    add_column :items, :item_set_id, :integer, index: true
  end
end
