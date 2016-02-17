class ItemsStates < ActiveRecord::Migration
  def change
    create_table :items_states, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :state, index: true
    end
  end
end
