class Room < ApplicationRecord
  has_many :devices

  validates :name, presence: true
  validates :name, uniqueness: true
end
