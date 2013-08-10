# t.string      :question
# t.string      :answer
# t.belongs_to  :deck
# t.timestamps
class Cards < ActiveRecord::Base
  belongs_to :ryan
  #this should not auto merge
  #belongs_to  :deck

end   
