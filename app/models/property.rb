class Property < ActiveRecord::Base
  has_many :values
  has_many :items, through: :values
  has_many :states

  def self.map_all
    found = self.find_each
    block_given? ? found.map{|item| yield(item)} : found
  end
end
