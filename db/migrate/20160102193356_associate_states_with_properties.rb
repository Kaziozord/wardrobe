class AssociateStatesWithProperties < ActiveRecord::Migration
  def change
    add_column :states, :property_id, :integer
    add_column :properties, :state_id, :integer
  end
end
