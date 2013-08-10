class ShuffledDeck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :shuffled_deck_cards
  belongs_to :round
end
