# t.string :name
# t.belongs_to :round
# t.timestamps

class ShuffledDeck < ActiveRecord::Base
  has_many :shuffled_deck_cards
  belongs_to :round
end
