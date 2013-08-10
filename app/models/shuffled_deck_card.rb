# t.string :question
# t.string :answer
# t.boolean :shown, default: false
# t.boolean :correct, default: false
# t.belongs_to :shuffled_deck

class ShuffledDeckCard < ActiveRecord::Base
  belongs_to :shuffled_deck
  scope :correct, -> { where(correct: true) }

end
