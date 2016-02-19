class Property < ActiveRecord::Base
  has_many :values
  has_many :items, through: :values
  has_many :states

  def self.map_all
    if block_given?
      self.all.map{|item| yield(item)}
    else
      raise ArgumentError, 'Block is not given'
    end
  end
end
