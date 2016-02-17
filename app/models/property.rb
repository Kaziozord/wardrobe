class Property < ActiveRecord::Base
  has_many :values
  has_many :items, through: :values
  has_many :states
end
