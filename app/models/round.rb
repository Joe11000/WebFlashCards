# t.belongs_to :user
# t.belongs_to :deck
# t.integer    :score
# t.timestamps
class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_one    :shuffled_deck
  has_many   :shuffled_deck_cards, through: :shuffled_deck 
end
