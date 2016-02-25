class Item < ActiveRecord::Base
  has_many :values
  has_many :properties, through: :values
  has_and_belongs_to_many :states
  has_and_belongs_to_many :item_sets

  def self.map_all
    found = self.find_each
    block_given? ? found.map{|item| yield(item)} : found
  end

  def get_value(property)
    self.values.find {|v| v.property_id == property.id }.value
  end

  def set_value(property, value)
    self.values.find {|v| v.property_id == property.id }
      .update_attributes(value: value)
  end
end
