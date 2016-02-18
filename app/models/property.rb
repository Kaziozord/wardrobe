class Property < ActiveRecord::Base
  has_many :values
  has_many :items, through: :values
  has_many :states

  scope :fetch_all, -> { all }
end
