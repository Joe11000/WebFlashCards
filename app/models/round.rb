# t.belongs_to :user
# t.belongs_to :deck
# t.integer    :score
# t.timestamps
class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many   :guesses, dependent: :destroy
  has_many   :cards, through: :guesses 
end
