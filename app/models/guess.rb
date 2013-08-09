# t.belongs_to  :round
# t.belongs_to  :card
# t.boolean     :correct
# t.timestamps
class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card
  has_one :user, through: :round
end
 
