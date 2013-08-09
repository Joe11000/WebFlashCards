# t.string      :question
# t.string      :answer
# t.belongs_to  :deck
# t.timestamps
class Card < ActiveRecord::Base
  belongs_to  :deck
end   
