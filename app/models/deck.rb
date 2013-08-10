# t.string    :name
# t.timestamps
class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards, dependent: :destroy
  has_many :users, through: :rounds
  validates :name, uniqueness: true, presence: true
end
