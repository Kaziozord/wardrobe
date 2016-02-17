class Value < ActiveRecord::Base
  belongs_to :property
  belongs_to :item
end
