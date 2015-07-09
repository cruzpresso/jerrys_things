class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  default_scope { order("created_at DESC") }
end
